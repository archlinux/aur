pkgname=('python-dynaphopy')
pkgver=1.17.0
pkgrel=1
pkgdesc="Dynaphopy allows to calculate anharmonic phonon linewidhts and frequency shifts using the mode descomposition technique"
arch=('any')
url="http://abelcarreras.github.io/DynaPhoPy/"
license=('MIT')
depends=("python-numpy" "python-scipy" "python-matplotlib" "python-phonopy")
optdepends=()
makedepends=('python-setuptools' 'python')
source=("https://github.com/abelcarreras/DynaPhoPy/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('bca8d61764bee95de9797e39bb9421ce69ac4cd4e75868c8e9d4d98143a424eaa7a2df09bbc3537807a90e64a2a9793aa3f14d279ac15e5805b0f53ca6acae55')



package() {
  cd "$srcdir"/DynaPhoPy-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}