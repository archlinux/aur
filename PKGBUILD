# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.281
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.281-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.281-x86_64.enc")
sha512sums=('5a073a1d4e2113daefa2ead455a23d9856a897028b4203509b83b0b9d440df907b757c2d2e2ed6fba8d0e9c6024dc146d912f4019f5e40726c8b0af51f9b5693')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.281-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.281/agentboard-0.3.281-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
