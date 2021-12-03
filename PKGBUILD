# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-HTMLmin
pkgname=python-flask-htmlmin
pkgver=2.1.0
pkgrel=2
pkgdesc='Flask html response minifier'
url='https://github.com/hamidfzm/Flask-HTMLmin'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-htmlmin')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
source=(https://github.com/hamidfzm/Flask-HTMLmin/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('a2958cf77c5ea7a0cc1f94a7b147be748ca52d923c6261de1a68f2cac2bc3d22')
sha512sums=('3d3ea40bc5d802f41b0d3a99fcca59407b3948d9b4fe2300bc597bbfbaa851435276a7dcee4b6cc08cc52b0674a53fd655b7bb1c6504bd53ea9963600626a59a')

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
