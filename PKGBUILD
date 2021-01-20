# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-HTMLmin
pkgname=python-flask-htmlmin
pkgver=2.0.2
pkgrel=1
pkgdesc='Flask html response minifier'
url='https://github.com/hamidfzm/Flask-HTMLmin'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-htmlmin')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
source=(https://github.com/hamidfzm/Flask-HTMLmin/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('549a5a191e891678e1f4d2def9056de2b354426f13857bfc2754580b94ba08e2')
sha512sums=('ea863644baecdf54d6b0a920ad0cbd84880e6c029a7d5313f0964f03233a74b7d11b3e15431ecf02fc6c33b38241e472968ed1bcad5b8163d14001678a4833e2')

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
