# Contributor: Avi H.D. <strykar@hotmail.com>
# Contributor: Damien Churchill <damoxc@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=connect
pkgver=1.105
pkgrel=4
pkgdesc="makes socket connection using SOCKS4/5 and HTTP tunnel."
arch=('i686' 'x86_64')
url="https://github.com/gotoh/ssh-connect"
license=('GPL')
depends=(glibc)
source=(https://github.com/gotoh/ssh-connect/archive/${pkgver}.tar.gz)
sha256sums=('96c50fefe7ecf015cf64ba6cec9e421ffd3b18fef809f59961ef9229df528f3e')

build() {
  cd "${srcdir}"/ssh-connect-"${pkgver}"
  make connect
}

package() {
  cd "${srcdir}"/ssh-connect-"${pkgver}"
  mkdir -p "${pkgdir}"/usr/bin
  install connect "${pkgdir}"/usr/bin
}
