# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-molmass
_name=${pkgname#python-}
pkgver=2023.4.10
pkgrel=1
pkgdesc="Molecular mass calculations"
arch=(i686 x86_64)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD3)
depends=('python>=3.8')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f885a4d6446eab3319fb6afe1772a988d541f2d4c1bac8399086f30cba93147e')

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
