# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.2
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.2-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.2-x86_64.enc")
sha512sums=('4aab6aaa444d1ec252e996d97467d2f32b4db819bb7264b6e9b311d4abc62d320a05157e6e0f94a6aae8f530874d9b2786ee6d2e51bc58ce2d34ee4db86258bf')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.2-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.2/speech-0.1.2-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
