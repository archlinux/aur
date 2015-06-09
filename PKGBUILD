# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=jsonwatch
pkgver=0.2.1
pkgrel=1
pkgdesc="Track changes in JSON data"
arch=('any')
depends=('python' 'python-six')
makedepends=('python-setuptools')
url="https://github.com/dbohdan/jsonwatch"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/dbohdan/$pkgname/tar.gz/v$pkgver)
sha256sums=('d70ef30187999c582b2e3561a0d3222b3c84d11b6d7439c08b04f9f9590c2ca6')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up stray files from pkgdir...'
  rm -f "$pkgdir/usr/"{LICENSE,README.md}
}
