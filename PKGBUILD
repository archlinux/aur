# Maintainer: redponike <proton (dot) me>

pkgname=python-trubar
pkgver=0.3.4
pkgrel=1
pkgdesc="Translation and localization of Python programs via modification of source files."
arch=('x86_64')
url="https://github.com/janezd/trubar"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-libcst' 'python-yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/janezd/trubar/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('08f5351d8cf8a96ee5f14a6eb44405b91c3898af655bcee89aa4519eb1193696')

build() {
  cd "${srcdir}/trubar-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/trubar-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
