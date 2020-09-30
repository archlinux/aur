pkgname=('phono3py')
pkgver=1.21.0
pkgrel=1
pkgdesc="phono3py calculates phonon-phonon interaction and related properties using the supercell approach"
arch=('any')
url="https://atztogo.github.io/phono3py"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib" "openblas" "lapacke")
makedepends=('python-setuptools' 'python')
source=("https://github.com/atztogo/phono3py/archive/v$pkgver.tar.gz")
sha512sums=('8b32c7e92527453fafd764dd7c32613bc5a2298824b6e4940c02a2df26758c1de31c23a3d2684dbdf8c71b37f0adc3de3d5cbaaf8dc3c79119aaa1fa66b85e9d')



package() {
  cd "$srcdir"/phono3py-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
