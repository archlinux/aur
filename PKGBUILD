# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.5
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=('bubblewrap' 'ostree' 'python-blessings' 'python-click' 'python-jinja'
         'python-gobject' 'python-grpcio' 'python-pluginbase' 'python-protobuf'
         'python-psutil' 'python-ruamel-yaml'
         # specific host site dependencies
         'bzr' 'git' 'lzip' 'python-arpy')
makedepends=('python-setuptools')
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('3847213e50ebe51806c8fff77925eda5208c8d402cc7b0beeade45999a20924f')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
