# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.7
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.7-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.7-x86_64.enc")
sha512sums=('adb64852d3acfe438675663106bf31eee41a96c063d574279807e65aee38e7db0ef281e2a0f413b908ad6fb6e13ac64502dd49b15f809c4ebd71ee7586a31713')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.7-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.7/speech-0.1.7-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
