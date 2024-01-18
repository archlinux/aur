# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Carsten Feuls <archlinux at carstenfeuls dot de>

pkgname=fllog
pkgver=1.2.8
pkgrel=1
pkgdesc="An Amateur Radio Logbook"
arch=('i686' 'x86_64')
url="http://www.w1hkj.com"
license=('GPL')
depends=('fltk')
source=("https://downloads.sourceforge.net/project/fldigi/fllog/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b6a6bde5964c3e59fa6c5ad88c9965db76c8e8ef9464de7dc260d483a94467260f244b47ca89e17b3015558a3564662a96530817eafc615a2895d84032d9695a')

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
