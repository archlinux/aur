# Maintainer: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-qt
pkgver=0.4.3
pkgrel=1
pkgdesc="Graphical User Interface (GUI) for NBFC-Linux (Qt-based)"
arch=('any')
url="https://github.com/nbfc-linux/nbfc-qt"
makedepends=('python3')
depends=('nbfc-linux>=0.3.17' 'python-pyqt6')
license=('GPL-3.0-only')
source=("https://github.com/nbfc-linux/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5eeb289b8b67bfdf88f3bf2614500a17dd30307d5ee683bf92e80d091b08e4de')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make QT_VERSION=6
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
