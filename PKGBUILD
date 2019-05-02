# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.2.6
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://buildstream.build/"
license=('LGPL')
depends=(bubblewrap ostree python-click python-jinja
         python-gobject python-grpcio python-pluginbase
         python-protobuf python-psutil
         python-ruamel-yaml0.15.51
         # specific host site dependencies
         bzr git lzip python-arpy)
makedepends=(python-setuptools)
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('2df19a004778c6a6dc97740c5c4c7d70e9e492dd383441332e8bfbd9e813c336')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
