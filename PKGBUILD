# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.309
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.309-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.309-x86_64.enc")
sha512sums=('33aadf1717fa136c1ad69704d285679d5fdb25b25e69ce6e9063cd2cf252a9b02b1a228d17bf695b3585dc41e37e860418d9ffe7b9baeb9813ef492183c5800a')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.309-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.309/agentboard-0.3.309-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
