# Maintainer: Nils Czernia <nils at czserverde dot de>
# Ex-Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=fllog
pkgver=1.2.9
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('x86_64')
url="https://www.w1hkj.org"
license=('GPL')
depends=('fltk')
source=("https://downloads.sourceforge.net/project/fldigi/fllog/${pkgname}-${pkgver}.tar.gz")
sha512sums=('fb562adef4ad7c85dfb9e1c32be65885b9a299c53d975445cf04e542fb5af914ee1842f4a5d95b71b49fa296c54810262ac28f86b698225b5457f1a49086ec3f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check || true
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
