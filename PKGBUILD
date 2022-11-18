# Maintainer: Bobby Hamblin <hamblingreen@hotmail.com>

pkgname='vosk-api-bin'
pkgver=0.3.43
pkgrel=1
pkgdesc='Offline speech recognition toolkit'
url='https://alphacephei.com/vosk/'
arch=('aarch64' 'armv7l' 'riscv64' 'x86_64' 'x86')
license=('Apache')
provides=('vosk-api')
conflicts=('vosk-api')

source=("https://alphacephei.com/kaldi/models/vosk-model-small-en-us-0.15.zip")
sha256sums=("30f26242c4eb449f948e42cb302dd7a686cb29a3423a8367f99ff41780942498")

source_aarch64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-aarch64-${pkgver}.zip")
source_armv7l=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-armv7l-${pkgver}.zip")
source_riscv64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-riscv64-${pkgver}.zip")
source_x86=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-x86-${pkgver}.zip")
source_x86_64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-x86_64-${pkgver}.zip")

sha256sums_aarch64=('14acc86898e9430f0aff32207a45445761aabc48feca0e381c65c91db634414b')
sha256sums_armv7l=('cf3dd76d8433a77840599a766039e31ba91df49e12285fa07f8892fff3ee3b4b')
sha256sums_riscv64=('abe83ae151ef791239ed5fb74fb861bf3bf65003709cf056cb8d2c7906339514')
sha256sums_x86_64=('75a92b73507df4f7fa0746d16f9ba9266ad6656fdf02aab3c6d1e91aa7bb9803')
sha256sums_x86=('2c109ce939aaaddca34164664f1bb4404415760fe7d2f4f3859134806b3902c6')

package() {
  cd "$srcdir/vosk-linux-$(uname -m)-$pkgver"

  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/local/share/vosk-models"

  install "libvosk.so" "$pkgdir/usr/lib/"
  install "vosk_api.h" "$pkgdir/usr/include/"

  cd "$srcdir"

  cp -r "vosk-model-small-en-us-0.15" "$pkgdir/usr/local/share/vosk-models/small-en-us/"
}
