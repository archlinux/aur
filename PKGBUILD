# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.300
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.300-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.300-x86_64.enc")
sha512sums=('5889b582492c6746aeb5805a4544396b27794f49f7a2c10f85f8b34467063310f878f1b7e6cd969671628e82c1e6cd909ab9019b09d9015b3d631610914f9d99')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.300-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.300/agentboard-0.3.300-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
