# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Henning Garus <henning.garus@gmail.com>
# Contributor: Patrik Hautala <phloyd@iki.fi>

pkgname=moe
pkgver=1.5
pkgrel=1
pkgdesc='A powerful, 8-bit clean, text editor. Supports ISO-8859-15 and ASCII.'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/moe/moe.html'
license=('GPL')
depends=('ncurses')
makedepends=('texinfo')
install=moe.install
backup=('etc/moerc')
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9657248473d04549d6e85e6d36a3e3c3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
