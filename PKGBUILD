# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=python-pymilter
_pkgname=pymilter
pkgver=1.0.4
pkgrel=1
pkgdesc="Python bindings for libmilter API"
arch=('x86_64')
url="https://github.com/sdgathman/pymilter"
license=('GPL')
depends=('python')
makedepends=('libmilter')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f871e29d2bb4bb192e9d9a1f205278f55cb0092a6c8c84ab698171924e4d2a2c')

build() {
  # Fix bad extract naming
  mv "${_pkgname}-${_pkgname}-${pkgver}" "${pkgname}-${pkgver}"

  # Build
  cd "${pkgname}-${pkgver}" 
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}"
}
