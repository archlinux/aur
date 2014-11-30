# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pscpug
pkgver=0.3.5
_pkgver=035
pkgrel=1
pkgdesc="A unix utility designed to graph a given process's CPU usage over time"
arch=('i686' 'x86_64')
url="http://www.diablonet.net/~mercadal/projects/pscpug/"
license=('BSD')
source=(http://www.diablonet.net/~mercadal/projects/pscpug/${pkgname}${_pkgver}.tgz)
md5sums=('625d23fc9b27e12f0a6411893e4d85d3')

build() {
  cd "${srcdir}"/${pkgname}${_pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/${pkgname}${_pkgver}

#install does not work correctly
#  make prefix="${pkgdir}" install
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
#license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}