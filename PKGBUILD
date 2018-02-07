# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildstream
pkgver=1.0.1
pkgrel=1
pkgdesc="Framework for modelling build pipelines in a declarative YAML format"
arch=('any')
url="https://wiki.gnome.org/Projects/BuildStream/"
license=('LGPL')
depends=('bubblewrap' 'ostree' 'python-blessings' 'python-click'
         'python-fusepy' 'python-gobject' 'python-pluginbase'
         'python-psutil' 'python-ruamel-yaml')
makedepends=('python-setuptools')
source=("https://download.gnome.org/sources/BuildStream/${pkgver%.*}/BuildStream-$pkgver.tar.xz")
sha256sums=('2ff4cede92ce16ceee6ab74d869249b6463a5d22129dcda7938f7b8e750dd62f')

package() {
	cd BuildStream-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1
}
