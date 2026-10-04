# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.294
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.294-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.294-x86_64.enc")
sha512sums=('13870797dc13429c063d41dbfbafcbe3e243c0d13c5e58ef30a5173050fc2e6b0975a326e780101b12b33269640b1eba196cf57610aafc89c306c398918490ff')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.294-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.294/agentboard-0.3.294-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
