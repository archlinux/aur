# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.7
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
sha256sums=('6a83ee0c311fc67bbf72460ca0103e2c81872bfc8a5f85e7228139ac2ec6546b')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
