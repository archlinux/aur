# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>
# Contributor: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=0.9.3
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL-3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4' 'python-dbus')
makedepends=('python-distutils-extra')
source=("https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('b7f1a298e87fb1235104d281bfc4d3aeb6ff7aea991ebb39f90cca3aeb27df8c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=$pkgdir/usr
}

