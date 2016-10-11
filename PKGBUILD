# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: David Vogt <dave at winged dot ch>

pkgname=rst2ctags
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple script to help create ctags-compatible tag files for the sections within a reStructuredText document"
arch=('any')
depends=('python2')
url="https://github.com/jszakmeister/rst2ctags"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jszakmeister/$pkgname/tar.gz/v$pkgver)
sha256sums=('6dc874684e04a81101ff2eda5341354f1b3134503d2d0153c1ee12e0beb6ff84')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 755 rst2ctags.py "$pkgdir/usr/bin/rst2ctags"
}
