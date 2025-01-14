# Maintainer: Filipe Fernandes <fernandes.fd at gmail dot com>

pkgname=xssproxy
pkgver=1.1.1
pkgrel=1
pkgdesc="Forward freedesktop.org idle inhibition service calls to Xss."
arch=('x86_64')
url="https://github.com/vincentbernat/xssproxy"
license=('GPL3')
depends=('libxss' 'glib2' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vincentbernat/xssproxy/archive/v${pkgver}.tar.gz")
sha512sums=('15061d7eeabebfb582afd845b0c970c1aa15e1edfc8ac97b249597ae9f8c3ea0e9891dd2921eafadf7869e868f71eb101943d93fddf88e0df7693c1bcf994cbb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" bindir="/usr/bin" man1dir="/usr/share/man/man1" install
}
