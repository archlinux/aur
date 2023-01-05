# Maintainer: Filipe Fernandes <fernandes.fd at gmail dot com>

pkgname=xssproxy
pkgver=1.1.0
pkgrel=1
pkgdesc="Forward freedesktop.org idle inhibition service calls to Xss."
arch=('x86_64')
url="https://github.com/vincentbernat/xssproxy"
license=('GPL3')
depends=('libxss' 'glib2' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vincentbernat/xssproxy/archive/v${pkgver}.tar.gz")
sha512sums=('4c195d161ce5d16e62e3482dbd7b78cfa9505aaee09f5532916ba8f32aef9be83ce5a3b454362ef04288f2c2237eb74e3f3106225227584c706230b2e3022397')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" bindir="/usr/bin" man1dir="/usr/share/man/man1" install
}
