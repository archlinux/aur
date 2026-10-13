# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.306
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.306-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.306-x86_64.enc")
sha512sums=('bf0228dbc15daba2fd67f6b9516ad20ee439949dfafd8ba3fec9f8cb12b1e5e63ebc50b38c1dee838332ba314d477045771673e5ff510f5dbc7fea8975939692')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.306-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.306/agentboard-0.3.306-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
