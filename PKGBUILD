# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.297
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.297-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.297-x86_64.enc")
sha512sums=('45db65f6681ea4f7a68c0f25b60924b2525c58e44d065141698194a548f3b5b523314c17921605368b14ce168bc393fc2c8635069ba1be946348a8252e59e97e')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.297-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.297/agentboard-0.3.297-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
