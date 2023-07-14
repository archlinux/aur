# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-phonolammps')
_pkgname=('phonoLAMMPS')
pkgver=0.9.1
pkgrel=1
pkgdesc="LAMMPS interface for phonon calculations using phonopy"
arch=('any')
url="https://phonolammps.readthedocs.io/"
license=('MIT')
depends=("python-phonopy" "python-numpy" "python-matplotlib" "python-seekpath" "python-dynaphopy")
optdepends=()
makedepends=('python-setuptools' 'python')
source=(
  https://files.pythonhosted.org/packages/b9/07/f3bd45557caf2a2e5a5eaf25062f196bd545fe34b98c921f807c564a1b22/${_pkgname}-${pkgver}.tar.gz
)
sha256sums=(
  'a5dcd72e09fbb8ee29d61e1084fbfda619ccd35a2324ca3a69a5b0baba7cbe18'
  )

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}

  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}