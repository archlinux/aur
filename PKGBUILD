# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-terminal
pkgver=0.1.9
pkgrel=1
pkgdesc="Agentics Terminal - the voice-reactive terminal, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-terminal-0.1.9-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-terminal-0.1.9-x86_64.enc")
sha512sums=('cd334c1654c9dd3b5ff271ece36d335d260978f65b7bc357892e857c904668e75afbccdc89201098ea9ea0bcddc3ee6891c0f9e6ed2d34c23419a75e6b8cfc0e')

package() {
  install -Dm644 "$srcdir/agentics-terminal-0.1.9-x86_64.enc" "$pkgdir/opt/agentics/components/terminal/0.1.9/terminal-0.1.9-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-terminal"
  printf '%s\n' \
    'agentics-terminal ships the encrypted Agentics terminal component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-terminal/README"
}
