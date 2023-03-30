# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-seekpath')
pkgver=2.0.1
pkgrel=1
pkgdesc="A module to obtain and visualize k-vector coefficients and obtain band paths in the Brillouin zone of crystal structures"
arch=('any')
url="https://github.com/giovannipizzi/seekpath"
license=('MIT')
depends=("python-numpy" "python-spglib")
optdepends=("python-scipy")
makedepends=('python-setuptools' 'python')
source=("https://github.com/giovannipizzi/seekpath/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d54bc497343a4e4ceb4002c20cfe93409f72a111c7acf3668042e39dc0010bc')



package() {
  cd "$srcdir"/seekpath-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}