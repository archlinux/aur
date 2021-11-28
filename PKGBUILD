# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-asyncstdlib
_name=${pkgname#python-}
pkgver=3.10.2
pkgrel=1
pkgdesc="The missing toolbox for an async world"
arch=('any')
url="https://github.com/maxfischer2781/asyncstdlib"
license=('MIT')
depends=('python-typing_extensions')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('474a3e73db68fb5a7fd416ac08354a6f137be39f56a4bc315662f1dfd580a4fb')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
