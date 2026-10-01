# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.293
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.293-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.293-x86_64.enc")
sha512sums=('2d50cc6669848783829f3949b71b0bbb6209fbd9ea79204a2bf1a2ac8f3248be9e9adf68887b93d85dfbbf4bce6b38021795cb977bf450b155a4e55b3b3d5756')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.293-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.293/agentboard-0.3.293-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
