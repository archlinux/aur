# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.336
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.336-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.336-x86_64")
sha512sums=('a7daa804a2eb78d4cdd90d044245058ace7547ab758eae4f868e981e21e88c0c77a757294cf48334f3cd282284448a0a883d8b8b4fa8723e24611ea482e7b90d')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.336-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.336/agentboard-0.3.336-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
