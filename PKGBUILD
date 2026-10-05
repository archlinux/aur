# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.295
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.295-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.295-x86_64.enc")
sha512sums=('a9706a46679cfaeb69a3546f1f49388957071ed663ce56bb76bf96e7ae4ced4121dec3983d493493338ea9b0fdd038aa920e19f9ae2e89dcd572252bbe0302c0')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.295-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.295/agentboard-0.3.295-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
