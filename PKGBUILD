# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.11.0-1
pkgver=5.11.0
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('b3f3482a99161261a704314d4a371419456d45e524f4bc44332a6a80651caa3e')

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
