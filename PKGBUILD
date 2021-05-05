# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>
_pipname=url-normalize
pkgname=python-$_pipname
pkgver=1.4.3
pkgrel=1
pkgdesc="URL normalization for Python"
arch=("any")
url="https://pypi.python.org/pypi/$_pipname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/ec/ea/780a38c99fef750897158c0afb83b979def3b379aaac28b31538d24c4e8f/$_pipname-$pkgver.tar.gz")
sha256sums=('d23d3a070ac52a67b83a1c59a0e68f8608d1cd538783b401bc9de2c0fac999b2')

build() {
  cd "${srcdir}/${_pipname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pipname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
