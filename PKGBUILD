# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-HTMLmin
pkgname=python-flask-htmlmin
pkgver=2.2.1
pkgrel=3
pkgdesc='Flask html response minifier'
url='https://github.com/hamidfzm/Flask-HTMLmin'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-htmlmin')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner' 'python-pip')
source=(https://github.com/hamidfzm/Flask-HTMLmin/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('bd744b84ea00f48a40d2d3e902fc23599f4d880269935f6a9b88f305d1e8d968')
sha512sums=('34d5c9e2393901b32ab43c4333d87d75b489a410af2fdb019c180d0cb7bac01074616125486b49ef577782311a394bde6444ce311d5ab4f2ae2852a3ea92f4cd')

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
