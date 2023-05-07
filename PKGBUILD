# Maintainer: Kherim Willems <aur@kher.im>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=python-pdb2pqr
_name=${pkgname#python-}
pkgver=3.6.1
pkgrel=1
pkgdesc="Automates many of the common tasks of preparing structures for continuum solvation calculations as well as many other types of biomolecular structure modeling, analysis, and simulation."
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=(BSD)
depends=('python>=3.5' 'python-mmcif-pdbx>=1.1.2' python-numpy 
         'python-propka>=3.5' python-requests python-docutils)
checkdepends=('python-pandas>=1.0' python-pytest python-testfixtures)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c056a4e6d28eb0f6117e5056f2f89612333a0a4bb9264581ea6595c883588758')
options=(!emptydirs)

build() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
