# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-HTMLmin
pkgbase=python-flask-htmlmin
pkgname=('python-flask-htmlmin' 'python2-flask-htmlmin')
pkgver=1.5.0
pkgrel=1
pkgdesc='Flask html response minifier'
url='https://github.com/hamidfzm/Flask-HTMLmin'
arch=('any')
license=('BSD')
makedepends=('python-setuptools' 'python-flask' 'python-htmlmin'
             'python2-setuptools' 'python2-flask' 'python2-htmlmin')
checkdepends=('python-pytest' 'python-pytest-cov'
              'python2-pytest' 'python2-pytest-cov')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/hamidfzm/Flask-HTMLmin/archive/v${pkgver}.tar.gz)
sha256sums=('3c4bd8a3d12f66e1ff59a7b72df8e6e6b81c562ea8dbb34577e577ea66bfffa2')
sha512sums=('71aaa80fdae5084758b2ede071ba455dc2572a1cbc29e0bc92ceaecc410400759ce369fc9eca5d083eeafb30957c7641b441fefaa885c871df624e01a7a0f839')

build() {
  cd ${_pkgname}-${pkgver}
  msg2 "Building python..."
  python setup.py build
  msg2 "Building python2..."
  python2 setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  msg2 "Checking python..."
  python setup.py test
  msg2 "Checking python2..."
  python2 setup.py test
}

package_python-flask-htmlmin() {
  depends=('python' 'python-flask' 'python-htmlmin')
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python2-flask-htmlmin() {
  depends=('python2' 'python2-flask' 'python2-htmlmin')
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
