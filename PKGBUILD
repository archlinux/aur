# Maintainer: Aleksandr Petrosyan <ap886@cantab.ac.uk> (aur.archlinux.org/account/appetrosyan)
pkgname=python-supernest
_name=sspr
pkgver=3.4.0
pkgrel=1
pkgdesc="A wrapper for usage of suerpositional nested sampling and repartitioning in the wild"
arch=(any)
url="https://gitlab.com/a-p-petrosyan/sspr"
license=(LGPL)
groups=()
depends=(python-numpy python-matplotlib python-scipy python-pandas python-mpi4py python-polychord)
optdepends=('openblas: faster linear algebra')
makedepends=(python-build python-installer)
provides=(anesthetic)
options=(!emptydirs)
install=
source=("https://gitlab.com/appetrosyan/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('4e3970751f64c54ecee7b47f1883db0494c7d82cd6e717dcf397f74e15da74fb')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

