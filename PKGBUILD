# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.2.3
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=(bubblewrap ostree python-click python-jinja
         python-gobject python-grpcio python-pluginbase
         python-protobuf python-psutil
         # specific host site dependencies
         bzr git lzip python-arpy)
makedepends=(python-setuptools)
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('3632f85b1db8b1a19c4099850e196664bd994a25dabb912f7ccfa40c539c1c76')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
