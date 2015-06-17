# Maintainer: Philippe Loctaux <loctauxphilippe@gmail.com>

pkgname=coldornot
pkgver=2.4
pkgrel=1
pkgdesc="A simple tool to convert temperatures"
arch=('i686' 'x86_64')
url="https://github.com/loctauxphilippe/${pkgname}"
license=('GPL2')
depends=('glibc')
source=("https://github.com/loctauxphilippe/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('24c7c54b5a823aa94077cd626e0b33eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
