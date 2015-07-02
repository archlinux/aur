# Contributor: Hervé Cauwelier <herve/oursours/net>
# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=jpegoptim
pkgver=1.4.3
pkgrel=1
pkgdesc="Jpeg optimisation utility"
arch=('i686' 'x86_64')
url="http://www.kokkonen.net/tjko/projects.html"
license=('GPL')
depends=('glibc' 'libjpeg')
source=(http://www.kokkonen.net/tjko/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('52987700d1db3a3002ec32b1d0dac489')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
  make strip
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
  install -m 644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
