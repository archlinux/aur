# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.308
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.308-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.308-x86_64.enc")
sha512sums=('3e4659c8f5dc3857d1287d53f6a305837ce7669f22cfc1e1a18acfaa935292daad601a489fecd1bca3716e97c846206e86ea5b8bb6bc352b6059bd8bf3503243')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.308-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.308/agentboard-0.3.308-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
