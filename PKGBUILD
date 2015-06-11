# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Dario 'Dax' Vilardi <dax@deelab.org>

pkgname=gkrellmlaunch
pkgver=0.5
pkgrel=7
pkgdesc="GKrellM plugin to add quicklaunch tabs for your favorite apps"
arch=('i686' 'x86_64')
url="http://gkrellmlaunch.sourceforge.net/"
license=('GPL')
depends=('gkrellm')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('110797c344a09daac71f71643b91fc6e')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/-W1//' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 $pkgname.so "$pkgdir/usr/lib/gkrellm2/plugins/$pkgname.so"
}
