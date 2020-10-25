# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>
# Contributor: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil
pkgver=0.9.5
pkgrel=1
pkgdesc="A simple music browser for MPD"
arch=('any')
license=('GPL-3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4' 'python-dbus')
makedepends=('python-distutils-extra')
source=("https://github.com/SoongNoonien/mpdevil/archive/v${pkgver}.tar.gz")
sha256sums=('ae23f45537428827806e21ac9e4521f9ef31e211e9f0add0f645b627f41e6ea0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=$pkgdir/usr
}

