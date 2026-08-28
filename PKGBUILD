# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.107
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.107-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.107-x86_64.enc")
sha512sums=('00f82db31d382de1d057f2ee9aad81d2cd13479716107aae2a32cb3d33e0318e59c0b056f919c0496cc0a97218abdfc3e4802b0352ca521f8fc029f0f68b4f3d')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.107-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.107/cli-2.1.107-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
