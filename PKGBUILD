# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.323
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.323-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.323-x86_64.enc")
sha512sums=('2c78f798e561361e33391d3ccb2244f63ca1bb1e540e686c96e91b81c52304e5cf9489e146eb849d01e2a1255107a8f6fb7102a7d9ea289f6a8a2ea9fae82eed')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.323-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.323/agentboard-0.3.323-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
