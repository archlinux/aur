# Maintainer: Benjamin Abendroth <braph93@gmx.de>

pkgname=nbfc-qt
pkgver=0.5.1
pkgrel=1
pkgdesc="Graphical User Interface (GUI) for NBFC-Linux (Qt-based)"
arch=('any')
url="https://github.com/nbfc-linux/nbfc-qt"
makedepends=('python3')
depends=('nbfc-linux>=0.4.0' 'python-pyqt6')
license=('GPL-3.0-only')
source=("https://github.com/nbfc-linux/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('26f351be423e2fb1c913df7dd65b0a4ea367588489716799d32f61e286b64e99')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make QT_VERSION=6
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
