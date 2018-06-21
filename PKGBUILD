# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.11.1-1
pkgver=5.11.1
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('b28ef254859c9302616f0345a8a0867daa3dcfc4a5bfb410759012951cf12272')

build() {
  mkdir -p "${srcdir}/build"
	cd "${srcdir}/build"
	qmake ../qsqlcipher-qt5-${_pkgver}/qsqlcipher.pro
	make
}

package() {
	cd "${srcdir}/build"
	make install INSTALL_ROOT="${pkgdir}"
}
