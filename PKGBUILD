pkgname=('phono3py')
pkgver=1.17.0
pkgrel=1
pkgdesc="phono3py calculates phonon-phonon interaction and related properties using the supercell approach"
arch=('any')
url="https://atztogo.github.io/phono3py"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib" "openblas" "lapacke")
makedepends=('python-setuptools' 'python')
source=("https://github.com/atztogo/phono3py/archive/v$pkgver.tar.gz")
sha512sums=('4b17748a89bba48373a5fbecc9d395876853d8637f0864c5c5ecc183144583820d11d9f1ca5f21bc7cdddf36bb7d3a765d3e6c71564f2c6dc8135bf8d1573fff')



package() {
  cd "$srcdir"/phono3py-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
