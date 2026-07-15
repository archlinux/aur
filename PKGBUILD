# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt
pkgver=0.1.1
pkgrel=1
pkgdesc="Agentics ASTT - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('agentics')
options=('!strip' '!debug')
source=("agentics-astt-0.1.1-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-0.1.1-x86_64.enc")
sha512sums=('6162b88cc5f63dbb7404f607a6d6ddfc0d74db622794cfaa2a8e8959b072adc64a2088eadbd41b067e0e6d581e216cb2e0b6be5041bf03bac4cc353ae3cb5b8b')

package() {
  install -Dm644 "$srcdir/agentics-astt-0.1.1-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.1/speech-0.1.1-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt"
  printf '%s\n' \
    'agentics-astt ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (agentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install the agentics package and launch it to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt/README"
}
