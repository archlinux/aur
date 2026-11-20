# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.334
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.334-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.334-x86_64")
sha512sums=('eb29e623f128dc14c3b4be6d2a8a987a4e4815eff0333a665776732fb173bd9b1678f3e360b5b5400d31a1a202d240e173ded7057672eccf55aee515990d67ad')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.334-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.334/agentboard-0.3.334-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
