# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Oliver Herold <oli@fixmbr.de>

pkgname=gkrellkam
pkgver=2.0.0
pkgrel=2
pkgdesc="Plugin for gkrellm2 to retrieve webcam pictures"
url="http://gkrellkam.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gkrellm' 'gtk2' 'wget')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/$pkgname/${pkgname}_$pkgver.tar.gz")
md5sums=('657c99de172bc7598098a6a4196ff07b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make LDFLAGS=-shared
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gkrellkam2.so "$pkgdir/usr/lib/gkrellm2/plugins/gkrellkam2.so"
}
