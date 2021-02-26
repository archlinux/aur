# Maintainer: Filipe Fernandes <fernandes.fd at gmail dot com>

pkgname=xssproxy
pkgver=1.0.0
pkgrel=1
pkgdesc="Forward freedesktop.org idle inhibition service calls to Xss."
arch=('x86_64')
url="https://github.com/timakro/xssproxy"
license=('GPL3')
depends=('libxss' 'glib2' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timakro/xssproxy/archive/v${pkgver}.tar.gz")
sha512sums=('baf238aacaab37728075391f00d5da334fbe6162b57c848e8f218cba28c2f1ddbd558231657ddbfc3cd7ef70015a993dad31c943464efbc925d0954e204af6a9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" bindir="/usr/bin" man1dir="/usr/share/man1" install
}
