# Maintainer: Ryonia Coruscare <echo ZGV2QGNvcnVzY2FyZS54eXoK | base64 -d>
# Contributor: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=rectangle-packer
pkgname=python-${_pkgname}
pkgver=2.1.0
pkgrel=4
pkgdesc="Pack a set of rectangles into a bounding box with minimum area"
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/Penlect/rectangle-packer"
license=('MIT')
depends=('python')
makedepends=('cython' 'python-setuptools')
provides=('python-rectangle-packer')
conflicts=('python-rectangle-packer')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('3bf2a04924827c813e73a49c8b763da4dbd6497af38158f7cd6c756db2ccdf2c4071c4de1e33d39bbd1279c931d90e339a8ce3dfe5034bd6ccf752e91bab1c3e')

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
