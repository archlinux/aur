# Maintainer: Asterios Dimitriou <asterios@pci.gr>

pkgname=libqsqlcipher
_pkgver=5.9.2-1
pkgver=5.9.2
pkgrel=1
pkgdesc="Qt5 sqldriver plugin for SQLCipher"
url="https://github.com/sjemens/qsqlcipher-qt5"
license=('LGPL3')
arch=('i686' 'x86_64')
depends=(qt5-base sqlcipher)
source=(qsqlcipher-qt5-${_pkgver}.tar.gz::"https://github.com/sjemens/qsqlcipher-qt5/archive/v${_pkgver}.tar.gz")
sha256sums=('de9bf0a3387b8cd838d4e1583f84855c9972ef8150140cf37ffecb848c81f7c8')

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
