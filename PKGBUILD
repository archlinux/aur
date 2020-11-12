# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-HTMLmin
pkgname=python-flask-htmlmin
pkgver=1.5.2
pkgrel=2
pkgdesc='Flask html response minifier'
url='https://github.com/hamidfzm/Flask-HTMLmin'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-htmlmin')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
source=(https://github.com/hamidfzm/Flask-HTMLmin/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('20be2e75861f069e47cf7ec04d9fc9d8e020ec73dbf473ed87d0d5e36dee0dea')
sha512sums=('8e08a7eeaf23a3c1b8a868f9962f00f17871deee19022f7f5865acf964b21cec6ab84fefba2aa74e3404e652794800faa4404147dd4e0004a59fcaabe741d92e')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
