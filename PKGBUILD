# Maintainer : Angel Perez <near1297@nauta.cu>
# Maintainer: nic96
pkgname=kiwix-desktop
pkgver=2.0
pkgrel=1
pkgdesc="Offline reader for Web content. It's especially intended to make Wikipedia available offline."
url="https://www.kiwix.org/"
arch=("any")
license=('GPLv3')
depends=("qt5-base" "qt5-webengine" "qt5-svg" "qt5-imageformats" "aria2" "kiwix-lib")
makedepends=("qt5-tools" "kiwix-lib")
source=("https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop-$pkgver.tar.gz")
conflicts=("kiwix-bin")
md5sums=('7bf4863ce081483d9a26b2abf021ec6d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    qmake PREFIX=$pkgdir/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}
