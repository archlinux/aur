# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.326
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.326-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.326-x86_64")
sha512sums=('145ee2684e357fbb16c6e878e15e2c5d23ad84228d4eecc11da4ed345d8beaee6fff2ad57887dd5e7fc660e0edd9d1af35144a78aea8e0e394394ae27ff93c00')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.326-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.326/agentboard-0.3.326-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
