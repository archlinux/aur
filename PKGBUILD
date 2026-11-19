# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.332
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.332-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.332-x86_64")
sha512sums=('f52d03a7bad80c34c2d008ba947a951129c69da57ffb008074006989f876776b4ed33945ed448842889d9a880b35fbe5c7a09d69cbadfc0682e06e8e624b0167')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.332-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.332/agentboard-0.3.332-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
