# Maintainer: Revincx <revincx233@gmail.com>

pkgname='magiskboot-bin'
pkgver=30.6
pkgrel=1
pkgdesc="magiskboot binary from magisk offical release"
arch=(
  x86_64
  i686
  aarch64
  armv7h
)
license=('GPL-3.0')
url="https://github.com/topjohnwu/Magisk"
conflicts=('magiskboot')
provides=('magiskboot')
source=(
   "https://github.com/topjohnwu/Magisk/releases/download/v$pkgver/Magisk-v$pkgver.apk"
)
sha256sums=(
    "f1ffc3c9a5614c251ba6bada308163acc3c3d844cf01d33f55a8bc151adc34ce"
)

package() {

    if [ ${CARCH} = "x86_64" ]; then
        install -Dm755 lib/x86_64/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 lib/arm64-v8a/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "i686" ]; then
        install -Dm755 lib/x86/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "armv7h" ]; then
        install -Dm755 lib/armeabi-v7a/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    fi
}
