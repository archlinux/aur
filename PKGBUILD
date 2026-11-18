# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.330
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.330-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.330-x86_64")
sha512sums=('aec7bca93d6414455d1927c7aa6cc9d88bc97893030dd16229a335971ff1f1d938a70ef7addc2686e116b34dbba322c7f7aaf7cde71c9e895984a47d2fc3bacc')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.330-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.330/agentboard-0.3.330-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
