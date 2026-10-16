# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.316
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.316-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.316-x86_64.enc")
sha512sums=('d349ed4bb7e6ed96a897a5327b7281d546b9b3bf79c3a46502b392f56558ed2da28d8ab8b15ff42d150cf9243623202984af48384687f1e5582e9c1de47559ab')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.316-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.316/agentboard-0.3.316-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
