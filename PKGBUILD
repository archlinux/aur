# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-terminal
pkgver=0.1.4
pkgrel=1
pkgdesc="Agentics Terminal - the voice-reactive terminal, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('gentics')
options=('!strip' '!debug')
source=("agentics-terminal-0.1.4-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-terminal-0.1.4-x86_64.enc")
sha512sums=('4cabcb6b14a57cb86c991763086334924e5672d7d4e0355b8f64891c5eb9a5b8aab2b9984833e063e4f5fbca22e34198ffb1a9f5e6dfd6ef11629e86780a4aa6')

package() {
  install -Dm644 "$srcdir/agentics-terminal-0.1.4-x86_64.enc" "$pkgdir/opt/agentics/components/terminal/0.1.4/terminal-0.1.4-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-terminal"
  printf '%s\n' \
    'agentics-terminal ships the encrypted Agentics terminal component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (gentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install and launch the Agentics launcher to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-terminal/README"
}
