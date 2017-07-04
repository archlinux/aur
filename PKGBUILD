# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.9.1-1
pkgver=5.9.1
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('e94435a0c5f164ab7c396f0acfd6de152db6f00ae886a39f32f6aeb0e027d9bb')

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
