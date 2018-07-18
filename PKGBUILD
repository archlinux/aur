# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.1.4
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=('bubblewrap' 'ostree' 'python-blessings' 'python-click'
         'python-jinja' 'python-gobject' 'python-pluginbase'
         'python-psutil' 'python-ruamel-yaml'
         # specific host site dependencies
         'bzr' 'git' 'lzip' 'python-arpy')
makedepends=('python-setuptools')
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('973743c7f762246f94af270e2f168d6296b0c84396a86006019bc43ac0946c38')

build() {
  cd BuildStream-$pkgver
  python setup.py build
}

package() {
  cd BuildStream-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
