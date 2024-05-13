# Maintainer: Martin Rys <rys.rs/contact>

pkgname=python-wekan
pkgver=0.2.0
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://github.com/bastianwenske/python-wekan"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bastianwenske/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('93e5344e5f163be6513740db5dac317fdc295ee6d58148f639ca80ee34fb3eb1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
