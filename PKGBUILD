# Maintainer: Stephen D. Cofer <stephen.d.cofer@outlook.com>

pkgname=enyo-doom
pkgver=1.01
pkgrel=1
pkgdesc="A frontend for Doom engines"
arch=('i686' 'x86_64')
url="https://github.com/stephendcofer/enyo-doom"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('chocolate-doom' 'prboom' 'zdoom')
source=("https://github.com/stephendcofer/enyo-doom/archive/1.01.tar.gz")
md5sums=('bea974f9686d9a28af79d5b03d5f179d')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
cmake . -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
         -DQT_QMAKE_EXECUTABLE=qmake-qt5
make
  }

package() {
cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR=${pkgdir} install
}

