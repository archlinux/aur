# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python38-opt_einsum
pkgver=3.3.0
pkgrel=5
pkgdesc="Optimizing einsum functions in NumPy, Tensorflow, Dask, and more with contraction order optimization"
url="https://github.com/dgasmith/opt_einsum"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
_name=opt_einsum
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('59f6475f77bbc37dcf7cd748519c0ec60722e91e63ca114e68821c0c54a46549')

build() {
  cd "$srcdir/$_name-$pkgver"
  python3.8 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python3.8 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
