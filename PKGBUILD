# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.8
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.8-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.8-x86_64.enc")
sha512sums=('3e7105b851ad32ed7d5d55d210c71ab5f9cea485eb88c1e71b701d25eafbdc5096674301e95267ab0fe7b1c18a7289184e72dc2141a362bb5075dbb5fa6395a5')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.8-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.8/speech-0.1.8-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
