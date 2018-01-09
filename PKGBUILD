# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=mons
pkgver=0.8.2
pkgrel=1
pkgdesc='POSIX Shell script to quickly manage 2-monitors display.'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
depends=('xorg-xrandr')
provides=("${pkgname}")
conflicts=("${pkgname}")
makedepends=('help2man')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/Ventto/libshlist/archive/v1.1.tar.gz")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd ${srcdir}
  rm -r ${pkgname}-${pkgver}/libshlist
  mv 'libshlist-1.1' ${pkgname}-${pkgver}/libshlist
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
