# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.319
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.319-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.319-x86_64.enc")
sha512sums=('cad1809f9db7355f9fbc783a1394a85e84abbed82617b5010a4606f15769b0e16213f9980db804a9aeee450c8b96565365b9bd1b5dc1dd2239e15b547b1c6f1b')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.319-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.319/agentboard-0.3.319-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
