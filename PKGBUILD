# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.284
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.284-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.284-x86_64.enc")
sha512sums=('20fa73f0bd3ff25002c72966707bbef8d67c34e39d9fb117cbdc92c7ed357c5b7cd1201b0c6f11b8cc39784a5ba85b69f4e6d8c35d7326f92ab59361a81e07a3')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.284-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.284/agentboard-0.3.284-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
