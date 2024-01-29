# Maintainer: Revincx <revincx233@gmail.com>

pkgname='magiskboot-bin'
pkgver=26.4
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
    "543a96fe26c012d99baf3a3aa5a97b80508d67cc641af7c12ce9f7b226b2b889"
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
