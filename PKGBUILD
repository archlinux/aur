# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.320
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.320-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.320-x86_64.enc")
sha512sums=('5c3b3ecf015c3387fdd46ecc49b3db55e1332c3599386c55cfb4f6febcd43a9b7aec1ad41493f78711ff473bca7909cfdec2ddbf416d5f654f6a399ce738d486')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.320-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.320/agentboard-0.3.320-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
