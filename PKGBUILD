# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.331
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.331-x86_64::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.331-x86_64")
sha512sums=('d3c5ba936242fcab7da6653d8e6a84f19500d9d53f3bbc72ae151a12e10fce011f0dbadcb8a97d8f7c269e2db134416e9afe17c49c78f58baec43f7f0f184eb5')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.331-x86_64" "$pkgdir/opt/agentics/components/agentboard/0.3.331/agentboard-0.3.331-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
