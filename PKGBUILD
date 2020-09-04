# Contributor: Damien Churchill <damoxc@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=connect
pkgver=1.105
pkgrel=3
pkgdesc="makes socket connection using SOCKS4/5 and HTTP tunnel."
arch=('i686' 'x86_64')
url="https://github.com/gotoh/ssh-connect"
license=('GPL')
depends=(glibc)
source=(https://github.com/gotoh/ssh-connect/archive/${pkgver}.tar.gz)
sha256sums=('96c50fefe7ecf015cf64ba6cec9e421ffd3b18fef809f59961ef9229df528f3e')
_hgversion='gotoh-connect-e122d9bd28e1'

build() {
  cd "${srcdir}/${_hgversion}"
  make connect
}

package() {
  cd "${srcdir}/${_hgversion}"
  mkdir -p ${pkgdir}/usr/bin
  install connect ${pkgdir}/usr/bin
}
