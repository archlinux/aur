pkgname=ttyvideo
pkgver='0.0.1'
pkgrel='1'
pkgdesc="ttyvideo displays videos in the terminal."
arch=('any')
license=('MIT')
depends=(opencv gstreamer gst-plugins-base)
makedepends=(cmake)
source=("https://github.com/jamesthoughton/ttyvideo/archive/0.0.1.tar.gz")
url='https://github.com/jamesthoughton/ttyvideo'
md5sums=('862c8cf756ad896f82654565ffc7f5ad')

build() {
    cd $srcdir/$pkgname-$pkgver
    cmake .
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm 755 ttyvideo $pkgdir/usr/bin/ttyvideo
}
