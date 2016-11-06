# Contributor: Damien Churchill <damoxc@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=connect
pkgver=1.105
pkgrel=1
pkgdesc="makes socket connection using SOCKS4/5 and HTTP tunnel."
arch=('i686' 'x86_64')
url="https://bitbucket.org/gotoh/connect"
license=('GPL')
depends=(glibc)
source=(https://bitbucket.org/gotoh/${pkgname}/get/${pkgver}.tar.gz)
sha256sums=('e7c98d31787f93b51c62ee05e0b558cfb577cda8198834a6d5b4d32528bf63ee')
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
