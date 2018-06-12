# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=lid-switch-dpms
pkgver=1.1
pkgrel=1
pkgdesc='Blank and unblank the screen on lid switch'
arch=('any')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libdrm' 'libxext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bd3a3e19cf986c439afc8700080632724508620c6a74e5b34dc806d898ec074e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
