# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=kover
pkgver=6
pkgrel=1
pkgdesc="easy to use WYSIWYG CD cover printer with CDDB and CDTEXT support"
arch=('i686' 'x86_64')
url="http://lisas.de/kover/"
license=('GPL2')
depends=('kdelibs' 'libcdio')
makedepends=('pkgconfig' 'cmake' 'automoc4')
source=(https://lisas.de/kover/${pkgname}-${pkgver}.tar.bz2)
md5sums=('9504afd8a779c54d7c77fb28d7b5c76e')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . || return 1
  make || return 1
  make DESTDIR=$pkgdir install
}
