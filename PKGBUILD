# Maintainer: nic96
pkgname=kiwix-desktop
pkgver=2.0rc1
url_ver=2.0-rc1
pkgrel=1
pkgdesc=""
url="https://www.kiwix.org/"
arch=("any")
license=('GPLv3')
depends=("qt5-base" "qt5-webengine" "qt5-svg" "qt5-imageformats" "aria2" "kiwix-lib")
makedepends=("qt5-tools")
source=("https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop-$url_ver.tar.gz")
conflicts=("kiwix-bin")
md5sums=('ce648a2a7e47366e8fe0ae7fa6f054da')

build() {
    cd "$srcdir/$pkgname-$url_ver"
    qmake PREFIX=$pkgdir/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$url_ver"
    make install
}
