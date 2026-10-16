# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-cli
pkgver=2.1.119
pkgrel=1
pkgdesc="Agentics CLI - the terminal Orb, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-cli-2.1.119-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-cli-2.1.119-x86_64.enc")
sha512sums=('ea2150a35798f89d04caf0a09fa5e618a901c08bfb174343bfe73b4734c5200f1e58250325a2b7285d9af9102970943bbc1ea5c502273a9f79ce0d1c918633de')

package() {
  install -Dm644 "$srcdir/agentics-cli-2.1.119-x86_64.enc" "$pkgdir/opt/agentics/components/cli/2.1.119/cli-2.1.119-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-cli"
  printf '%s\n' \
    'agentics-cli ships the encrypted Agentics cli component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-cli/README"
}
