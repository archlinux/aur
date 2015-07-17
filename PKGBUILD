# Contributor: Damien Churchill <damoxc@gmail.com>
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=connect
pkgver=1.104
pkgrel=1
pkgdesc="makes socket connection using SOCKS4/5 and HTTP tunnel."
arch=('i686' 'x86_64')
url="https://bitbucket.org/gotoh/connect"
license=('GPL')
depends=(glibc)
source=(https://bitbucket.org/gotoh/${pkgname}/get/${pkgver}.tar.gz)
sha256sums=('6ca5291ea8e4a402d875a5507ac78d635373584fd1912f2838b93e03b99730c8')
_hgversion='gotoh-connect-cf9579815b7e'

build() {
  cd "${srcdir}/gotoh-connect-fd6f352325d4"
  make connect
}

package() {
  cd "${srcdir}/gotoh-connect-fd6f352325d4"
  mkdir -p ${pkgdir}/usr/bin
  install connect ${pkgdir}/usr/bin
}
