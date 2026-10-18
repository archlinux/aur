# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.322
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.322-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.322-x86_64.enc")
sha512sums=('05888be66a50bc25ab8fbf526d52be70d94ff3c6c393f894472a1a5c0e12eccf535d770f199a2ef62a2863ebc15c5e80cf3ed8bd739c8e642e1f6045556b6c66')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.322-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.322/agentboard-0.3.322-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
