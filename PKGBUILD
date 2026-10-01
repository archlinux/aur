# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-terminal
pkgver=0.1.14
pkgrel=1
pkgdesc="Agentics Terminal - the voice-reactive terminal, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-terminal-0.1.14-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-terminal-0.1.14-x86_64.enc")
sha512sums=('8f117efcc2f1992c823688cd78d108e1c3beaf7d8276f83f62ad44a12100b343214dc6918f7622b835fd73d908a83603fe254c332dcf63a107e8825ac0f068e7')

package() {
  install -Dm644 "$srcdir/agentics-terminal-0.1.14-x86_64.enc" "$pkgdir/opt/agentics/components/terminal/0.1.14/terminal-0.1.14-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-terminal"
  printf '%s\n' \
    'agentics-terminal ships the encrypted Agentics terminal component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-terminal/README"
}
