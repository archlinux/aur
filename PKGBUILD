# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=duperemove
pkgver=0.11.1
pkgrel=1
pkgdesc='Btrfs extent deduplication utility'
arch=('x86_64' 'i686')
url='https://github.com/markfasheh/duperemove'
license=('GPL')
depends=('glib2' 'sqlite')
conflicts=('duperemove-git')
source=(https://github.com/markfasheh/duperemove/archive/v$pkgver.tar.gz)
sha512sums=('3c344b00b8fb58a259840aea977ba2e5123b651bb58ec84177bdfd8337a377361984b85c6325271b7d3e4ea216017fa6fda793136c83e9837a13ec041df326b9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="${pkgdir}" install
}
