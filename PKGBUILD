# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.111
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.111-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.111-x86_64.enc")
sha512sums=('22ed81ac7740f0f76282e0bb12fe4b155a8a14b5d1846e0be026884a30eeb6d4785ceb8bf2b5f94c1b5b68ed84c514721b2c9b5ff052cb4a39a18f5fb5828f23')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.111-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.111/cli-2.1.111-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
