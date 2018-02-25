# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wgetpkg
pkgver=0.2.0
pkgrel=1
pkgdesc="Download AUR packages with wget"
arch=('any')
depends=('wget')
url="https://github.com/atweiden/wgetpkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('7d0d60b4aa62579b71f585b072b5189596709f153c9fb75efa346a3ceea87418')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 755 wgetpkg -t "$pkgdir/usr/bin"
}
