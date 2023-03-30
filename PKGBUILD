# Maintainer: Jose Riha < jose 1711 gmail com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thom Wiggers <thom@thomwiggers.nl>

_base=pympress
pkgname=python-${_base}
pkgdesc="Simple and powerful dual-screen PDF reader designed for presentations"
pkgver=1.8.1
pkgrel=1
arch=(any)
url="https://github.com/Cimbali/${_base}"
license=(GPL)
depends=(poppler-glib gtk3 python-cairo gdk-pixbuf2 python-gobject gobject-introspection python-watchdog perl-x11-protocol perl-net-dbus)
makedepends=(python-setuptools python-babel)
optdepends=('vlc: for play videos'
  'python-vlc: for play videos'
  'gstreamer: for play videos')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('431361cf5b39ee4daf9a0d4d589b9394cb8776cda0d39175330e82f7a7fc390d108a27521b4adf7b85d671781a821289edb325f0a97ef52d5d633da4fb3a3797')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
