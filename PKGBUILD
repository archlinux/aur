# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=rectangle-packer
pkgname=python-${_pkgname}
pkgver=2.0.1
pkgrel=1
pkgdesc="Pack a set of rectangles into a bounding box with minimum area"
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/Penlect/rectangle-packer"
license=('MIT')
depends=('python')
makedepends=('cython' 'python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 "LICENSE.md" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
