# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.337
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.337-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.337-x86_64")
sha512sums=('424408fd22bc610792cabfe710e24d9b8e5398de6fc4a2c9609f1f3268dd6cb4eec61cb1794bc54999e2959bf8ef6f0575c201ce0046e074de413efea9f042bd')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.337-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.337/agentboard-0.3.337-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
