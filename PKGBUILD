# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.327
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.327-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.327-x86_64")
sha512sums=('f8626346a8b2063a8284154b465ffa78a2f724d32b16abd4516c34977624e7026380ad37f7ff22175e0c9e5bb88a5f6b9f95e8bdc77ed7ee3157e263ea50e7c5')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.327-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.327/agentboard-0.3.327-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
