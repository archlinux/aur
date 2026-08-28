# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.5
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.5-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.5-x86_64.enc")
sha512sums=('e67c7673a485e76e8e7492b842f104259c5730a6b4e7a417561e280831a3bf51471141ba6661a7ffff789ca4c8f6d65219b6726f43e0bd107f67df15fb139dca')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.5-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.5/speech-0.1.5-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
