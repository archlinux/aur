# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>
# Contributor: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=0.9.8
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL-3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4')
makedepends=('python-distutils-extra')
source=("https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('543d1974be47622dc1c497aee9aa6a0ab468988e037b2b523976707576626b97')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=$pkgdir/usr
}

