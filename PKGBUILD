# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=1.4.0
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4')
makedepends=('python-distutils-extra')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('c6d5c47b693121aeb75f99eef9a43e496f58aea09ce8ff85043238766352aeaf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

