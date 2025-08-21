# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-pretty-errors
_pkgname=pretty_errors
pkgver=1.2.25
pkgrel=3
pkgdesc="Prettifies Python exception output to make it legible."
arch=(any)
url="https://github.com/onelivesleft/PrettyErrors/"
license=(MIT)
depends=('python' 'python-colorama')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
  "LICENSE")
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  cd ..
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('a16ba5c752c87c263bf92f8b4b58624e3b1e29271a9391f564f12b86e93c6755'
            '2ccbee3ac0a79860a08fbc4d1916058bdc15986d88681d40568cfb282bba2bc6')
