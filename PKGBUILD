# Maintainer: yuhldr <yuhldr@qq.com>

pkgname="dynaphopy"
_pkgname="DynaPhoPy"
pkgver=1.17.15
pkgrel=1
pkgdesc="Dynaphopy allows to calculate anharmonic phonon linewidhts and frequency shifts using the mode descomposition technique"
arch=('any')
url="https://github.com/abelcarreras/${_pkgname}"
license=('MIT')
depends=("python-scipy" "python-phonopy")
optdepends=()
makedepends=('python-setuptools' 'python')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('eaa9d18f7518f8cab53c8d41bc0f10ad683586b85ac7b6d368e7f8c7c5ca38aa')



package() {
  cd "$srcdir"/${_pkgname}-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}