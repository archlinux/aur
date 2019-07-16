# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.3.1
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://buildstream.build/"
license=('LGPL')
depends=(bubblewrap ostree python-click python-jinja
         python-gobject python-grpcio python-pluginbase
         python-protobuf python-psutil python-pyroaring
         python-ruamel-yaml0.15.51 python-ujson
         # specific host site dependencies
         bzr git lzip python-arpy)
makedepends=(python-setuptools cython)
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('ccc43733cc099ef743964ff2cedf0c262e2e1c30d0f6c8ee021a94249d581ae7')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
