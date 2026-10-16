# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.312
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.312-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.312-x86_64.enc")
sha512sums=('401326a575b83912c6fa6a8cf1cc0b1920231e9bc91be00b25f6af052ca4caf89679b60e7e89c21b83d076df56499c9351e77ba0edde146efdbae1f88b95684d')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.312-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.312/agentboard-0.3.312-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
