# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pycoinmon
pkgver=0.4.8
pkgrel=1
pkgdesc='Cryptocurrency price tool on CLI (Python version)'
arch=('any')
url=https://github.com/RDCH106/pycoinmon
license=('MIT')
depends=('python-colorama' 'python-humanize' 'python-py-spin' 'python-requests'
         'python-setuptools' 'python-tabulate')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('1e969e60612cc0ea1aaafaa63346349620b7d4d9d3864fed2a144a85bd049dddc2cc08961328e502dced87f4617d80ef8f2aaf00333fc1863130daacdb0810b2')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
