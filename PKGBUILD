# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: wanglun <iseuer@gmail.com>
#
pkgname=gimp-plugin-exif-browser
pkgver=0.1.0
pkgrel=4
pkgdesc="This is an Exif Viewer, mainly for jpeg photos taken with a digital camera. It is an update of the 'Exif Browser' plugin from the old registry. It requires a recent version of libexif (tested with 0.6.16)."
arch=('i686' 'x86_64')
url="http://registry.gimp.org/node/8839"
license=('GPL')
depends=('gimp>=2.4')
makedepends=('libexif')
source=(http://registry.gimp.org/files/exif-browser.tar.gz)
md5sums=('24902f4143445141ab0249fab9141b2a')

build() {
  cd "$srcdir/exif-browser"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/exif-browser"
  make DESTDIR="$pkgdir/" install
}
