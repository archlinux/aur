#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=neurdflib
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=5.0.1
pkgrel=2
pkgdesc="Temporary package from nipype waiting for merge into the primary rdflib repo"
url="https://github.com/RDFLib/rdflib/pull/649"
arch=('any')
license=('BSD')
depends=('python')
provides=("python-neurdflib")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/ef/3f/1bd3f7cbebd2707bde56f99d2df62d771470dce52f8142d3c4cecde3dd34/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('d34493cee15029ff5db16157429585ff863ba5542675a4d8a94a0da1bc6e3a50')
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

