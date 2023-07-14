# Maintainer: yuhldr <yuhldr@qq.com>

_pkgname="dynaphopy"
pkgname="python-${_pkgname}"
pkgver=1.17.15
pkgrel=1
pkgdesc="Dynaphopy allows to calculate anharmonic phonon linewidhts and frequency shifts using the mode descomposition technique"
arch=('any')
url="http://abelcarreras.github.io/DynaPhoPy/"
license=('MIT')
depends=("python-scipy" "python-matplotlib" "python-phonopy")
optdepends=()
makedepends=('python-setuptools' 'python')
source=("https://files.pythonhosted.org/packages/a1/33/23f8ff28ea9cc54fe99d1743af07ae2c1d0dcbe817b14eb959a8fc573f02/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f163a16a4b0186c297916b981bf5be7e75e4747ab636fe6c8280a549ecb9ec7f')



package() {
  cd "$srcdir"/${_pkgname}-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}