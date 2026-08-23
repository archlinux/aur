# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.4
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.4-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.4-x86_64.enc")
sha512sums=('d5c0e4284f44dd4b6af1c4ee4ee1ea11b60d5d69ed92855b6672bc43d68d6b95a1e5d1e3b4dd217defd825d395e7b778729af66ab33035f2ad2766cad9da0ca2')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.4-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.4/speech-0.1.4-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
