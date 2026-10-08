# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.299
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.299-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.299-x86_64.enc")
sha512sums=('044901bde8a29303aac92adf644878a143b1be4df92eb3cfba4d363425a333eff8a7cefd08f23efc2e6e4ca1f8974203ac600d5c63b85334d14b0927f7915c61')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.299-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.299/agentboard-0.3.299-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
