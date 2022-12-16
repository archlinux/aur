# Maintainer: Bobby Hamblin <hamblingreen@hotmail.com>

pkgname='vosk-api-bin'
pkgver=0.3.45
pkgrel=1
pkgdesc='Offline speech recognition toolkit'
url='https://alphacephei.com/vosk/'
arch=('aarch64' 'armv7l' 'riscv64' 'x86_64' 'x86')
license=('Apache')
provides=('vosk-api')
conflicts=('vosk-api')

source=("https://alphacephei.com/kaldi/models/vosk-model-small-en-us-0.15.zip")
sha256sums=('30f26242c4eb449f948e42cb302dd7a686cb29a3423a8367f99ff41780942498')
sha256sums_aarch64=('45e95d37755deb07568e79497d7feba8c03aee5a9e071df29961aa023fd94541')
sha256sums_armv7l=('10b795ae478ef1d530fcbfbbea9ccbbbf3b7e7c244bd5fd3176f4a6af32f3c8c')
sha256sums_riscv64=('9e7f890e6a464526600fcf94e3a223ff5db960f21e4ee2b51ac49b71c28fa860')
sha256sums_x86_64=('bbdc8ed85c43979f6443142889770ea95cbfbc56cffb5c5dcd73afa875c5fbb2')
sha256sums_x86=('b539efc22780948bd98e2ecb9c1b92ca08b3c552a18744f7202ab78405b8e1f9')

source_aarch64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-aarch64-${pkgver}.zip")
source_armv7l=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-armv7l-${pkgver}.zip")
source_riscv64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-riscv64-${pkgver}.zip")
source_x86=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-x86-${pkgver}.zip")
source_x86_64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-linux-x86_64-${pkgver}.zip")


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
