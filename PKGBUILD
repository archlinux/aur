# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.313
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.313-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.313-x86_64.enc")
sha512sums=('f0f3a8083541a4070b5249bd5a83cff4abf325b8fd4d75f6c2d8b42bdb271347a92cd0d47f2d0831aac9a10b3358df0f6f68a0cad36b037d40ade62ce6abf468')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.313-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.313/agentboard-0.3.313-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
