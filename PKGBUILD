# Maintainer: Ricardo Constantino <ricardo@tsu.re>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

_pkg=ruyaml
pkgname=python-${_pkg/./-}
pkgver=0.20.0
pkgrel=2
pkgdesc="ruyaml is a openly maintained fork of elusive ruamel-yaml package that can be used as as a drop-in replacement."
arch=('any')
url="https://github.com/pycontribs/ruyaml"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/r/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('647362fc649d83bd591a4f69b42571fad56057a3d9e3d5ce57b12f4b4b8e71f62e02113870f407c7984605a284f79e352ac12a4be44da956434cc8d255b7f1b1')

build() {
  cd ${_pkg}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
