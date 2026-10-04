# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.113
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.113-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.113-x86_64.enc")
sha512sums=('60054b51e71417504b09fab30af1b338b061d8060905b05c0279967fb5da0eee910250979bd5acb69db2707a1cd811c953249652994e2d3f0ff8e34ebd9855e5')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.113-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.113/cli-2.1.113-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
