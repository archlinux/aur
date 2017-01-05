# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=zint
pkgver=2.5
pkgrel=1
pkgdesc="A barcode encoding library supporting over 50 symbologies."
url="http://sourceforge.net/projects/zint/"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('qt4' 'zlib')
makedepends=('cmake')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.src.tar.gz")
sha256sums=('42d227275adb1a7253935e551b69b0a26734207b11c4d8f0b079d408235ea0ee')

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
