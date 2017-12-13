# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.2.2
pkgrel=1
pkgdesc="Generate ctags-compatible tags files for Markdown documents"
arch=('any')
depends=('python2')
url="https://github.com/jszakmeister/markdown2ctags"
license=('BSD3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver)
sha256sums=('3ce04a82ed0107c877e1b5d7c5c5fb60b3548dfe5d8041d7ed5c3057539d6f75')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/markdown2ctags"

  msg2 'Installing documentation...'
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/markdown2ctags"

  msg2 'Installing...'
  install -Dm 755 markdown2ctags.py "$pkgdir/usr/bin/markdown2ctags"
}
