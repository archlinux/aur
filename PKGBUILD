# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-terminal
pkgver=0.1.6
pkgrel=1
pkgdesc="Agentics Terminal - the voice-reactive terminal, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-terminal-0.1.6-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-terminal-0.1.6-x86_64.enc")
sha512sums=('c0e85eefbf2b2dd879a18b7d7617d9fe9ee98b66f36fcdfc1218855c1dc109e36c43c18d3b9ebb4841d17a963986dccd19c500b2f874aa41deeb2f949a8fc19d')

package() {
  install -Dm644 "$srcdir/agentics-terminal-0.1.6-x86_64.enc" "$pkgdir/opt/agentics/components/terminal/0.1.6/terminal-0.1.6-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-terminal"
  printf '%s\n' \
    'agentics-terminal ships the encrypted Agentics terminal component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-terminal/README"
}
