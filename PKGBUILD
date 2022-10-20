# Maintainer: Kherim Willems <aur@kher.im>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-pdb2pqr
_name=${pkgname#python-}
pkgver=3.5.2
pkgrel=1
pkgdesc="Automates many of the common tasks of preparing structures for continuum solvation calculations as well as many other types of biomolecular structure modeling, analysis, and simulation."
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.6' python-numpy python-requests python-docutils 
         'python-propka>=3.2' 'python-pandas>=1.0' 'python-pytest>=5.4.1'
         'python-mmcif-pdbx>=1.1.2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9d145ff3797a563ce818f9d2488413ac339f66c58230670c2455b2572cccd957')
options=(!emptydirs)

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
