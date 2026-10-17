# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.318
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.318-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.318-x86_64.enc")
sha512sums=('02287f3b9e8409ffda63aef7cb116506230dcc8e26b842f6e0cd868826f53f0bfd9b21a7b77cb88b7a065531c0beecb85be7f2aa46f57a2017bc42dd4e4f1c53')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.318-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.318/agentboard-0.3.318-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
