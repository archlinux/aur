# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=markdown2ctags
pkgver=0.2.0
pkgrel=1
pkgdesc="Generate ctags-compatible tags files for Markdown documents"
arch=('any')
depends=('python2')
url="https://github.com/jszakmeister/markdown2ctags"
license=('BSD3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver)
sha256sums=('d6a3e1d445b7d412b21e81894d5c3fa9a3a0317229ba08abe4527d3593e539ad')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/markdown2ctags"

  msg2 'Installing documentation...'
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/markdown2ctags"

  msg2 'Installing...'
  install -Dm 755 markdown2ctags.py "$pkgdir/usr/bin/markdown2ctags"
}
