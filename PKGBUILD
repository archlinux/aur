# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.2.2
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=(bubblewrap ostree python-click python-jinja
         python-gobject python-grpcio python-pluginbase
         python-protobuf python-psutil python-ruamel-yaml
         # specific host site dependencies
         bzr git lzip python-arpy)
makedepends=(python-setuptools)
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('dd0b04e239c362e7ac44e202874da6e9ebfaaad038db513b9af3d57904f77e91')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
