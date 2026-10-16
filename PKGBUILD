# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-agentboard
pkgver=0.3.317
pkgrel=1
pkgdesc="Agentics AgentBoard - the desktop PowerBoard host, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-agentboard-0.3.317-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-agentboard-0.3.317-x86_64.enc")
sha512sums=('2f4e4f31be5fbc023b5152be0267971eb7b824b6ed68a418ab0093b1dc9466c237d17d6f2bc1861e6d54b0e08abb4e3f2896cd93150ca3b41cd9c3304b4009d8')

package() {
  install -Dm644 "$srcdir/agentics-agentboard-0.3.317-x86_64.enc" "$pkgdir/opt/agentics/components/agentboard/0.3.317/agentboard-0.3.317-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-agentboard"
  printf '%s\n' \
    'agentics-agentboard ships the encrypted Agentics agentboard component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-agentboard/README"
}
