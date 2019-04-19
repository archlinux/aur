# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mruby
pkgver=2.0.1
pkgrel=1
pkgdesc='Lightweight Ruby'
arch=(i686 x86_64)
url='https://github.com/mruby/mruby'
license=(MIT)
depends=(readline)
makedepends=(git bison ruby)
options=(staticlibs)
source=(mruby-$pkgver.zip::https://github.com/mruby/mruby/archive/$pkgver.zip)
sha1sums=('571fd2d57d158bb8c592c87a0fd9f1c1c1d36b40')

build() {
  cd mruby-$pkgver
  make
}

check() {
  cd mruby-$pkgver
  make test
}

package() {
  cd mruby-$pkgver

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/mruby"
  cp build/host/bin/* "$pkgdir/usr/bin"
  cp build/host/lib/*.a "$pkgdir/usr/lib"
  cp -r include "$pkgdir/usr"

  cp LICENSE "$pkgdir/usr/share/licenses/mruby/LICENSE"
}

