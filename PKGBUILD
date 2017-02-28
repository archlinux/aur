# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.1.3
pkgrel=1
pkgdesc="Generate ctags-compatible tags files for Markdown documents"
arch=('any')
depends=('python2')
url="https://github.com/jszakmeister/markdown2ctags"
license=('BSD3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver)
sha256sums=('cc0443229f956ac89fc8c353a23c81f7ccbd89f0fba5ac0019c54b05522ba60b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing Python version...'
  sed -i 's#/usr/bin/env python#/usr/bin/env python2#' markdown2ctags.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/markdown2ctags"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/markdown2ctags"

  msg2 'Installing...'
  install -Dm 755 markdown2ctags.py "$pkgdir/usr/bin/markdown2ctags"
}
