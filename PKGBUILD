# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=0.2.37
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-0.2.37-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-0.2.37-x86_64.enc")
sha512sums=('d3e98ab949e4fd25cf71397a089610913b52dc457bab7290e9e6b94a98ac3fa0eef4a356179d4a1799e4f55d3282dfaa4a4621d2a98eab2e8ef3b66687b151be')

package() {
  install -Dm644 "$srcdir/agentics-cli-0.2.37-x86_64.enc" "$pkgdir/opt/agentics/components/cli/0.2.37/cli-0.2.37-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
