# Maintainer: yuhldr <yuhldr@qq.com>

_pkgname=('phonolammps')
pkgname=('python-phonolammps')
pkgver=0.9.1
pkgrel=2
pkgdesc="LAMMPS interface for phonon calculations using phonopy"
arch=('any')
url="https://github.com/abelcarreras/phonolammps"
license=('MIT')
depends=("python-seekpath" "dynaphopy")
optdepends=()
makedepends=('python-setuptools' 'python')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz
)
sha256sums=('46d1611fd1d7f3d6dcfe5209966ee8594bd36410b6ac45f9a2d89f7f884b0daf')

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}

  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}