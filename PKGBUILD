# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.328
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.328-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.328-x86_64")
sha512sums=('e3320281d2750feb1947e4831bfa8237fc12be7ff1f8b3e34f906c262ad597b71b3b8c33f4b525d660acc686a070ba2b94d25a21286d852734f26fb660f61a74')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.328-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.328/agentboard-0.3.328-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
