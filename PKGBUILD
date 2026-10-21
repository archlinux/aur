# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.324
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.324-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.324-x86_64.enc")
sha512sums=('17e4bb3d6b71ee4f9e0f3daeeb5f8f81621eab946c73bd20710d4b7cdef181c51235ef31623f092b490534040a5727ca8f3b5cc1c160ba2375403ae6d9386423')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.324-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.324/agentboard-0.3.324-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
