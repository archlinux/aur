# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.10.1-1
pkgver=5.10.1
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('22d98100addcaa030487fe3156d19b85881ada06a64f70a70e68a680a9b0025d')

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
