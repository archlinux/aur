# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=openbox-themes-ceti-2
pkgver=0.0.1
pkgrel=1
pkgdesc="Ceti-2 theme for Openbox"
arch=('any')
optdepends=('ceti-2-themes: GTK themes')
url="https://github.com/atweiden/openbox-themes-ceti-2"
license=('GPL3')
groups=('openbox-themes')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('0a9fbcdab9deed6e1ed4bd548e48ceeded69bf5365f4f8ec892f208f8c48c352')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/themes/Ceti-2"
  cp -dpr --no-preserve=ownership openbox-3 "$pkgdir/usr/share/themes/Ceti-2"
}
