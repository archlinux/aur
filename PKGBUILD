# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.4.1
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
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
    python-ujson
    # specific host site dependencies
    bzr git lzip python-arpy
)
makedepends=(python-setuptools cython)
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('fa8a8b9e8f432cbd33f03afc798dcf59f564755b39c262bf6c8846e76d66e390')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
