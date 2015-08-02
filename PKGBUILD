# Maintainer: Grey Christoforo <grey[at]christoforo[dot]net>
pkgname=uranium
pkgver=15.06.02
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('GPLv3')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'arcus')
#optdepends=('java-runtime')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
#install='foo.install'
source=("https://github.com/Ultimaker/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('c3b5e070090b2d026e1547ef8d4532fe')

build() {
  cd "${srcdir}/Uranium-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/Uranium-${pkgver}"
  make DESTDIR="${pkgdir}" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
