# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.314
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.314-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.314-x86_64.enc")
sha512sums=('57ba24abcc27729a29efa227727066e22b29696d20b3675ca4a81483b42e528b5103a6d9351b7e91d0636938d0f2fada1788a18310ad52fd5114b60ac8780165')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.314-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.314/agentboard-0.3.314-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
