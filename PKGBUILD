# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-astt-v2
pkgver=0.1.1
pkgrel=1
pkgdesc="Agentics ASTT v2 - the on-device speech engine, an encrypted Agentics component decrypted and run at runtime by the Agentics launcher"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=('gentics')
options=('!strip' '!debug')
source=("agentics-astt-v2-0.1.1-x86_64.enc::https://repo.agentics.co.za/x86_64/agentics-astt-v2-0.1.1-x86_64.enc")
sha512sums=('6162b88cc5f63dbb7404f607a6d6ddfc0d74db622794cfaa2a8e8959b072adc64a2088eadbd41b067e0e6d581e216cb2e0b6be5041bf03bac4cc353ae3cb5b8b')

package() {
  install -Dm644 "$srcdir/agentics-astt-v2-0.1.1-x86_64.enc" "$pkgdir/opt/agentics/components/speech/0.1.1/speech-0.1.1-linux-amd64.enc"
  install -dm755 "$pkgdir/usr/share/doc/agentics-astt-v2"
  printf '%s\n' \
    'agentics-astt-v2 ships the encrypted Agentics speech component.' \
    'It is decrypted and executed at runtime by the Agentics launcher (gentics)' \
    'and its managerd relay, which perform the sealed-box key exchange with the' \
    'Agentics hub. Install and launch the Agentics launcher to use this component.' \
    > "$pkgdir/usr/share/doc/agentics-astt-v2/README"
}
