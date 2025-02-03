# Maintainer: bzt <unmacaque at gmail dot com>

pkgname=bign-handheld-thumbnailer
pkgver=1.1.2
pkgrel=1
pkgdesc='A thumbnailer for Nintendo handheld systems (Nintendo DS and 3DS) roms and files'
url='https://github.com/MateusRodCosta/bign-handheld-thumbnailer/'
license=('GPL-2.0-or-later')
makedepends=('cargo' 'meson' 'ninja')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MateusRodCosta/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1bc2e6aa441cb8e889df797d2cc5fc4d29e929ecd7ed902b27e27b67cea64109')

build() {
  cd "$pkgname-$pkgver"
  meson setup _build -Dprefix=/usr
  meson compile -C _build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C _build --destdir "$pkgdir"
}
