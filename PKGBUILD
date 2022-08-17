# Maintainer: Jose Riha < jose 1711 gmail com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thom Wiggers <thom@thomwiggers.nl>

_base=pympress
pkgname=python-${_base}
pkgdesc="Simple and powerful dual-screen PDF reader designed for presentations"
pkgver=1.7.2
pkgrel=2
arch=(any)
url="https://github.com/Cimbali/${_base}"
license=(GPL)
depends=(poppler-glib gtk3 python-cairo gdk-pixbuf2 python-gobject gobject-introspection python-watchdog perl-x11-protocol perl-net-dbus)
makedepends=(python-setuptools python-babel)
optdepends=('vlc: for play videos'
  'python-vlc: for play videos'
  'gstreamer: for play videos')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('430de8bc8746610cb84a72bbcfc6fb5783e2737cf5eddfb5fb4244c34125a7c86007dd404868c4e235cb85f9bb4e09dc087861e999c01f8b6317276d966a3805')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
