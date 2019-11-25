# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mruby
pkgver=2.1.0
pkgrel=1
pkgdesc='Lightweight Ruby'
arch=(i686 x86_64)
url='https://github.com/mruby/mruby'
license=(MIT)
depends=(readline)
makedepends=(git bison ruby)
options=(staticlibs)
source=(mruby-$pkgver.zip::https://github.com/mruby/mruby/archive/$pkgver.zip)
sha1sums=('723535bd1eb13a847d99b94cb16c630c72818c7a')

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

