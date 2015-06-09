# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=rst2ctags
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple script to help create ctags-compatible tag files for the sections within a reStructuredText document"
arch=('any')
depends=('python')
url="https://github.com/jszakmeister/rst2ctags"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver)
sha256sums=('80519b443c07804364812035d3ea9105b051abe169f78afc938806c4414a39b2')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  msg 'Installing documentation...'
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"

  msg 'Installing...'
  install -Dm 755 rst2ctags.py "$pkgdir/usr/bin/rst2ctags"
}
