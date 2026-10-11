# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.302
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.302-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.302-x86_64.enc")
sha512sums=('fcc793b12612622843dd3c7c7cd319a69259268c4b7c3ca5fee8903cce04fa0a28c788ff9ddcb718aeffd0c40c137d37bab66693d33206d03fc0e2a64c60a7fd')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.302-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.302/agentboard-0.3.302-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
