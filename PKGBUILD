# Maintainer: Ayase Utena (au@0x64.dev)
pkgname=viusb
pkgver=0.1
pkgrel=1
pkgdesc="Qt-powered advanced 'visual' lsusb"
arch=('any')
url="https://github.com/0x64620/viusb"
license=('GPL3')
depends=('qt5-base' 'usbutils')
makedepends=('cmake' 'make' 'git')
source=("git+https://github.com/0x64620/viusb.git"
        "viusb.desktop")
sha256sums=('SKIP'
            '4576c44737cd208e591b2a9181b321e7aafce90d9087fb3dc30618b13d6f20d7'
            )

build() {
    cd "$srcdir/viusb"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/viusb/build"
    install -Dm777 "$srcdir/viusb/build/viusb" "$pkgdir/usr/bin/viusb"

    install -Dm644 "$srcdir/viusb.desktop" "$pkgdir/usr/share/applications/viusb.desktop"
}
