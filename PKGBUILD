# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname=kdsoap
pkgver=1.5.0
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
license=('GPL3' 'LGPL' 'custom')
arch=('x86_64' 'i686')
url='https://github.com/KDAB/KDSoap'
depends=('qt5-base')
conflicts=('kdsoap-qt4')
makedepends=('python2' 'git')
source=("https://github.com/KDAB/KDSoap/releases/download/kdsoap-${pkgver}/kdsoap-${pkgver}.tar.gz")
sha256sums=('da46eb676d7b05393bddf8c78c0dc8256419d61f34e10c2951d9855f2b78d4e6')

build() {
  cd "$pkgname-$pkgver"
  ./configure.sh -release -shared -prefix /usr
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
