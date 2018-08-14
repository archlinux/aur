# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.6
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
sha256sums=('f872c53e2b8d9a852364a58408f0df3667a83e38258cba89f8bfe5d14464e88b')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
