# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Scott Fial <scott at fial dot com>

pkgname=tamsyn-font
pkgver=1.11
pkgrel=6
pkgdesc="A monospaced bitmap font for the console and X11"
arch=('any')
url="https://www.fial.com/~scott/tamsyn-font"
license=('custom')
depends=('xorg-fonts-encodings')
#source=("https://www.fial.com/~scott/$pkgname/download/$pkgname-$pkgver.tar.gz")
source=("https://web.archive.org/web/20200616131205if_/http://www.fial.com/~scott/tamsyn-font/download/tamsyn-font-1.11.tar.gz")
md5sums=('6ec13672d2f0d6a829f2403cdeebd980')
sha256sums=('97be1b604441b725548c454a92603993eb96e493f508845638a86c8d64fbf24e')

package () {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/misc"
  install -d "$pkgdir/usr/share/kbd/consolefonts"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m644 *.pcf "$pkgdir/usr/share/fonts/misc/"
  install -m644 *.psf.gz "$pkgdir/usr/share/kbd/consolefonts/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/"
}
