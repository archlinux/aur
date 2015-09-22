# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=irvm 
pkgver=0.0.3
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'bison>=2.7' 'flex')
depends=('glibc')
pkgdesc="virtual machine for Andrew W. Appel's tree intermediate representation"
install=irvm.install
url="https://github.com/pablooliveira/irvm"
license=('GPL')
source=(https://github.com/pablooliveira/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('8f195f7898f26e4830b13d4b8e1ca4cd')

build() {
  cd ${pkgname}-${pkgver}
  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D -m 644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
