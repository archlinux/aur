# Maintainer: Revincx <revincx233@gmail.com>

pkgname='magiskboot-bin'
pkgver=28.1
pkgrel=1
pkgdesc="magiskboot binary from magisk offical release"
arch=(
  x86_64
  i686
  aarch64
  armv7h
)
license=('GPL3')
url="https://github.com/topjohnwu/Magisk"
conflicts=('magiskboot-git')
makedepends=('unzip')
source=(
   "https://github.com/topjohnwu/Magisk/releases/download/v$pkgver/Magisk-v$pkgver.apk"
)
sha256sums=(
    "8bfd3346b3da5814f82eff6f1b1b5fedd0ad585f39a25709b23eb54aac45691d"
)

package() {

    if [ ${CARCH} = "x86_64" ]; then
        install -Dm755 lib/x86_64/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "aarch64" ]; then
        install -Dm755 lib/arm64-v8a/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "i686" ]; then
        install -Dm755 lib/x86/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    elif [ ${CARCH} = "armeabi-v7a" ]; then
        install -Dm755 lib/arm64-v8a/libmagiskboot.so ${pkgdir}/usr/bin/magiskboot
    fi
}
