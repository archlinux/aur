# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-coolname
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Random Name and Slug Generator"
arch=('any')
url="https://github.com/alexanderlukanin13/coolname"
license=('BSD')
depends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('410fe6ea9999bf96f2856ef0c726d5f38782bbefb7bb1aca0e91e0dc98ed09e3')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
