#
# stubgen PKGBUILD
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>
# Past Maintainer: Romain Schmitz <myself at slopjong dot de>


pkgname=stubgen
pkgver=2.1.0
pkgrel=1
pkgdesc="Creates implementation stubs from C++ headers."
arch=('i686' 'x86_64')
url="http://www.radwin.org/michael/projects/stubgen/"
license=('BSD')
depends=('make' 'flex' 'bison')
source=(https://github.com/mjradwin/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('3afb7d27bf44ec762d0a392dde7e2879')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make CFLAGS="-Wno-error -O"
}

 package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/{bin,share/stubgen}
  mv stubgen ${pkgdir}/usr/bin
  mv ChangeLog ${pkgdir}/usr/share/stubgen
  mv README ${pkgdir}/usr/share/stubgen
}

# EOF
