# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=wmx
pkgver=7
pkgrel=1
pkgdesc="The ideal window manager for today's elegant and ascetic programmer"
arch=('x86_64' 'i686')
url="http://www.all-day-breakfast.com/wmx/"
license=('custom')
depends=('libxft' 'libxpm')
source=("http://www.all-day-breakfast.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8ffa4335a2100d0437fe177239241cbec6aba79650ececf3148f4dc27e09bc05')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure LIBS=-lfontconfig --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 README.contrib "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
