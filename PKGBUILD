# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.109
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.109-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.109-x86_64.enc")
sha512sums=('ff82d61041c502e0e7f78bcafa7d3383f94a8b018828f585408d94f5b60be75f9ecceb11c7011d8de7c2310e7e8d491af7de17c4ef2c1b2d7c40066500c5e0a9')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.109-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.109/cli-2.1.109-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
