# Maintainer: Filipe Fernandes <fernandes.fd at gmail dot com>

pkgname=xssproxy
pkgver=1.0.1
pkgrel=2
pkgdesc="Forward freedesktop.org idle inhibition service calls to Xss."
arch=('x86_64')
url="https://github.com/vincentbernat/xssproxy"
license=('GPL3')
depends=('libxss' 'glib2' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vincentbernat/xssproxy/archive/v${pkgver}.tar.gz")
sha512sums=('22e5e48fbf21f08f42f0a171a8a06c097efadd63ade5639f8d9f074ccf48549a60b1a8312a2f0891f9401e2e72081af26220ff1f10ba5395f37178a4bf1688de')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" bindir="/usr/bin" man1dir="/usr/share/man/man1" install
}
