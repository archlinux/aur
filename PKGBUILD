# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.301
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.301-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.301-x86_64.enc")
sha512sums=('ca75d89ca879330991416b257ce40f6907da3c1efde24705c76bfc191915f3a25fa04a54cdc725d2dcedcbfaab3c5fdd88a42351c11d368e9aeff23f6ea464a9')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.301-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.301/agentboard-0.3.301-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
