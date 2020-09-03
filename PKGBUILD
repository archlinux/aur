# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>
# Contributor: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=0.9.0
pkgrel=1
pkgdesc="A small MPD client written in python"
arch=('any')
license=('GPL-3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4' 'python-dbus')
makedepends=('python-distutils-extra')
source=("https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('17442842643f58ff6bd01e21fd5e2ac590882a8c7cb76630dae1655a9c2b2b5c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=$pkgdir/usr
}

