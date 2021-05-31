# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.6.1
pkgrel=1
pkgdesc="A powerful and flexible software integration toolset"
arch=('any')
url="https://buildstream.build"
license=('LGPL')
depends=(
    bubblewrap
    python-click
    python-gobject
    python-grpcio
    python-jinja
    python-pluginbase
    python-protobuf
    python-psutil
    python-pyroaring
    python-ruamel-yaml
    python-six
    python-ujson
    # specific host site dependencies
    bzr git lzip ostree python-arpy
)
makedepends=(python-setuptools cython)
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('2ba614e13c0641c28e27dc3c41e5b2418e729a9e39ffc06064b8b713390a6b5c')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
