# Maintainer: KokaKiwi <kokakiwi+git@kokakiwi.net>

_pkgname=mergedeep
pkgname="python-${_pkgname}"
pkgver=1.3.4
pkgrel=1
pkgdesc='A deep merge function for Python'
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0096d52e9dad9939c3d975a774666af186eda617e6ca84df4c94dec30004f2a8')
b2sums=('0bccb80c59c482647cad18be5eb5d9bb25433e999f3d693d0adcad6ffe661a0abf8ea65ef46a84b5d56a7e04033e69dd304e408c163b2e61a2daca46a480903c')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licences/${pkgname}/LICENSE"
}
