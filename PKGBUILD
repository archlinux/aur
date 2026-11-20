# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.333
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.333-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.333-x86_64")
sha512sums=('f411daa5f96713fc646ae26f3b4bdbc1d4c774ce42ab645517a94b55d5a12b9101cefb3a858c75c05efa6c95f0c88a537d9c6338376e527d25b3a65bd6873e73')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.333-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.333/agentboard-0.3.333-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
