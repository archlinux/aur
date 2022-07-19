# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-HTMLmin
pkgname=python-flask-htmlmin
pkgver=2.2.0
pkgrel=1
pkgdesc='Flask html response minifier'
url='https://github.com/hamidfzm/Flask-HTMLmin'
arch=('any')
license=('BSD')
depends=('python' 'python-flask' 'python-htmlmin')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
source=(https://github.com/hamidfzm/Flask-HTMLmin/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('09ec02228692e41baa9a688261c71116efe38cafbae9d771fce5f476ecb52171')
sha512sums=('24287ef93e99a16e7dde35ba6b7b8fefa06f11ce30fb47969313c3e0e1135ac8a2685aac06bc430d3253162f4f2bc7e8eed90ddda2092bbad092d4e0d09cb4fc')

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
