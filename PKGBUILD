# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.303
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.303-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.303-x86_64.enc")
sha512sums=('f6f119f8fb4c05b101fdfbad86d6ad3cf27123f8588799341ab179f6010ebd6a3f635c76a3bb1db794fa8c43a70fee045337eede40c351ae9f70ae8de132e128')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.303-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.303/agentboard-0.3.303-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
