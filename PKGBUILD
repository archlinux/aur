# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pycoinmon
pkgver=0.4.7
pkgrel=1
pkgdesc='Cryptocurrency price tool on CLI (Python version)'
arch=('any')
url=https://github.com/RDCH106/pycoinmon
license=('MIT')
depends=('python-colorama' 'python-humanize' 'python-py-spin' 'python-requests' 'python-tabulate')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('39bc9e19d26ecf3db3df93cb14a9ae54f122c7e1b9f888a9f4fee0d8fcd2873aa34b6ee6c7847cb63c65442a17380e45bdfe4ea9cbd1b7c7dac410799f8d9dcf')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python -m unittest discover tests
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
