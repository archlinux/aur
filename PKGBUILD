# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.315
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.315-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.315-x86_64.enc")
sha512sums=('a174a32570dad18c63b4ce056caad3ed06dc1deede1be9a98777722c3540513e079a20d33fe23aa52c0091822eae60a4df50670f613eadfff3af49a6ca597257')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.315-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.315/agentboard-0.3.315-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
