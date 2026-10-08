# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.298
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.298-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.298-x86_64.enc")
sha512sums=('8becb30e7559ed4888c8227feb7e64957e350b4ff5edb2455abd53f154997d66ce0881c9b6a130b9418f8895cee3de0a75fa775da5e5aa5980cc77a68c0fabbf')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.298-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.298/agentboard-0.3.298-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
