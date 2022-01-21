# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-pdb2pqr
_name=${pkgname#python-}
pkgver=3.5.1
pkgrel=1
pkgdesc="Automates many of the common tasks of preparing structures for continuum solvation calculations as well as many other types of biomolecular structure modeling, analysis, and simulation."
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.6' python-numpy python-requests 'python-docutils<0.18' 'python-propka>=3.2' 'python-pandas>=1.0' 'python-pytest>=5.4.1' 'python-mmcif-pdbx>=1.1.2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('50272a850e876ea76d253e21eb01041ac8a01f7f17d73d0da95b26a6204c2564')
options=(!emptydirs)

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
