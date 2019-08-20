pkgname=('dynaphopy')
pkgver=1.15.3
pkgrel=1
pkgdesc="Dynaphopy allows to calculate anharmonic phonon linewidhts and frequency shifts using the mode descomposition technique"
arch=('any')
url="http://abelcarreras.github.io/DynaPhoPy/"
license=('MIT')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib" "openblas")
optdepends=("python-pyfftw" "seekpath" "openmpi")
makedepends=('python-setuptools' 'python')
source=("https://github.com/abelcarreras/DynaPhoPy/archive/$pkgver.tar.gz")
sha512sums=('985db806827c838d3c7659e441752a3558ce5d865ed899301d6c55578e26ae15af875c05aa2b67d9ea9e38b0891d7eb5e9c1d737572bcafbf1e6115a7e5df0a4')



package() {
  cd "$srcdir"/DynaPhoPy-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
