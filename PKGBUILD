# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.290
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.290-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.290-x86_64.enc")
sha512sums=('c6e3f782d3150a1745612db1dc9a258f1f6c38de43b037daf03cd7bf18f7a5068b7133a512524de51a3dd0d74b84b5d0f338b13373db9501a237eccf5f074fd6')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.290-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.290/agentboard-0.3.290-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
