# Maintainer: VIVID <vivid@headrat.org>

pkgname=libg15render
pkgver=3.0.5a
pkgrel=1
pkgdesc="A small graphics library optimised for drawing on an LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/libg15render"
license=('GPL')
depends=('libg15')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('1bc457695fe4a4166035ea61922af7e8a8247fff7f946997539926f2e7802f152b2587518dfc76a5a036ec4346cbcc70e51c85205619c72609272f511cdebd9a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
