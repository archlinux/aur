# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname=kdsoap-qt4
pkgver=1.5.1
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=('GPL3' 'LGPL' 'custom')
arch=('x86_64' 'i686')
url='https://github.com/KDAB/KDSoap'
depends=('qt4')
conflicts=('kdsoap')
makedepends=('python2' 'git')
source=("https://github.com/KDAB/KDSoap/releases/download/kdsoap-${pkgver}/kdsoap-${pkgver}.tar.gz")
sha256sums=('fc4506a91db59aef33aadba9fa828c59047ac7bfdd13a23fe4ba7b66450d4844')

build() {
  cd "kdsoap-$pkgver" 
  ./configure.sh -release -shared -prefix /usr -qmake /usr/bin/qmake-qt4
  make 
}

package() {
  cd "kdsoap-$pkgver"
  make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
