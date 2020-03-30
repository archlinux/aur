pkgname=('phono3py')
pkgver=1.18.2
pkgrel=1
pkgdesc="phono3py calculates phonon-phonon interaction and related properties using the supercell approach"
arch=('any')
url="https://atztogo.github.io/phono3py"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib" "openblas" "lapacke")
makedepends=('python-setuptools' 'python')
source=("https://github.com/atztogo/phono3py/archive/v$pkgver.tar.gz")
sha512sums=('92dc522d2a944b6ec2616775afebfb0d7c3743bdf684056e70652bf442c47407c000ee1993bfde6be4a5d0ff8e4c0956846931a5eaabdd20aa38bacf1ad0d52e')



package() {
  cd "$srcdir"/phono3py-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
