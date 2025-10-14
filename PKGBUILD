# Maintainer: Revincx <revincx233@gmail.com>

pkgname='magiskboot-bin'
pkgver=29.0
pkgrel=2
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
    "99d40df1a68a05a5e78452a9cd4f2d753434d7622baeeb44ea14ae8238c1a9ca"
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
