# Maintainer:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=flam3
pkgver=3.1.1
pkgrel=2
pkgdesc="Tools to create/display fractal flames: algorithmically generated images and animations"
arch=('x86_64')
url="http://flam3.com/"
license=('GPL3')
depends=('libjpeg' 'libpng' 'libxml2')
source=(https://github.com/scottdraves/flam3/archive/v${pkgver}.tar.gz)
sha1sums=('0bab806472b82f8fd20a8f96023ab80151c2f5ba')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
