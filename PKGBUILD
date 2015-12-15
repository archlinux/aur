# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=wmx
pkgver=7.1
pkgrel=2
pkgdesc="The ideal window manager for today's elegant and ascetic programmer"
arch=('x86_64' 'i686')
url="http://www.all-day-breakfast.com/wmx/"
license=('custom')
depends=('libxft' 'libxpm')
#source=("http://www.all-day-breakfast.com/$pkgname/$pkgname-$pkgver.tar.gz")
source=("https://github.com/bbidulock/wmx/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('845ee80dedb088b2522e99f86680aee6ab44e3ef4705e384e238661c7a62dfde')

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
