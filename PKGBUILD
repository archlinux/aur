# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Martin Wimpress <code@flexion.org>

_pkgname=fastimport
pkgname=python2-fastimport
pkgver=0.9.11
pkgrel=1
pkgdesc="VCS fastimport/fastexport parser"
arch=(any)
url="https://pypi.python.org/pypi/fastimport/"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ec81ddc3148f35ac5c77cce894995cf2ad66028831b73327190e1363a5f049d9')

build() {
  cd "$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
