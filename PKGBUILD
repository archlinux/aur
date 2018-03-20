# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Scott Fial <scott at fial dot com>

pkgname=tamsyn-console-font
pkgver=1.11
pkgrel=1
pkgdesc="A monospaced bitmap font for the console"
arch=('any')
url="http://www.fial.com/~scott/tamsyn-font"
license=('custom')
source=(http://www.fial.com/~scott/${pkgname/-console}/download/${pkgname/-console/}-$pkgver.tar.gz)
sha256sums=('97be1b604441b725548c454a92603993eb96e493f508845638a86c8d64fbf24e')
conflicts=('tamsyn-font')

package() {
  cd "$srcdir/${pkgname/-console/}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -Dm 644 *.psf.gz -t "$pkgdir/usr/share/kbd/consolefonts"
}
