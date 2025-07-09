# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=gf2bv
pkgname=python-$_pkgname-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Solving linear systems over GF(2) by manipulating bitvectors"
url="https://github.com/maple3142/gf2bv"
license=("MIT")
arch=("any")
depends=('m4ri')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
optdepends=('sagemath')
source=(git+$url)
sha256sums=('SKIP')


build() {
  cd $srcdir/${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}




