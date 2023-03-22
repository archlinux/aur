# Maintainer: Jose Riha < jose 1711 gmail com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thom Wiggers <thom@thomwiggers.nl>

_base=pympress
pkgname=python-${_base}
pkgdesc="Simple and powerful dual-screen PDF reader designed for presentations"
pkgver=1.8.0
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
sha512sums=('553166fd00739b7aefe9384cdf163e186624e3447df928a29df1433156811c0219cbd43a2951975c91a60992245bd9a520b7cecc6ed329474093fa24394c7e24')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
