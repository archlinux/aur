# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-birdseye
pkgver=0.9.3
pkgrel=2
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
url="http://github.com/alexmojaki/birdseye"
depends=(python-littleutils python-flask-humanize python-humanize python-flask-humanize python-cheap_repr python-outdated python-sqlalchemy python-cached-property python-future python-asttokens)
makedepends=('python-setuptools-scm')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/b/birdseye/birdseye-${pkgver}.tar.gz")
sha256sums=('8a43008afe6c7d54c59a117fe6c818bc8cdd895bb8aa0b0949514073cbe809c0')

build() {
  cd "birdseye-${pkgver}"
  python setup.py build
}

package() {
  cd "birdseye-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-birdseye/LICENSE.txt"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/python-birdseye/README.rst
}
