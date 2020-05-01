# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
pkgname=gimp-plugin-lqr
pkgver=0.7.2
pkgrel=3
pkgdesc="Plugin for The GIMP providing Liquid Rescale"
arch=('x86_64')
url="https://liquidrescale.wikidot.com/"
license=('GPL')
depends=('gimp' 'liblqr')
makedepends=('intltool')
source=(https://liquidrescale.wikidot.com/local--files/en:download-page-sources/gimp-lqr-plugin-$pkgver.tar.bz2)
md5sums=('af7eb1a0d480bacfa6e5eff9b06bd877')

build() {
  cd "$srcdir"/gimp-lqr-plugin-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/gimp-lqr-plugin-$pkgver
  make DESTDIR="$pkgdir" install
}

