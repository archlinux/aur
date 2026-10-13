# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.305
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.305-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.305-x86_64.enc")
sha512sums=('b2d3d643dd31c8151e852981c68add31331cbfc286aa473a5027b555e7427983a1bceb19ee6f8e0e6d282ce694c08c124761c3e0cb078ec0c1dd9be4dc6bb957')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.305-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.305/agentboard-0.3.305-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
