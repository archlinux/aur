# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.280
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('gentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.280-x86_64.enc::https://software.agentics.co.za/agentics/x86_64/agentics-agentboard-0.3.280-x86_64.enc")
sha512sums=('a9c2e07656eabcc8c1abbc6c30297de8039c6019f53904b2f8e6248d6ccad001bb745953f407d1fc91e9d15e54608df7d233d8aaa76e7b84bde918424abd14a1')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.280-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.280/agentboard-0.3.280-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (gentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install and launch the Agentics launcher to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
