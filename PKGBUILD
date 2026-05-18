# Maintainer: bzt <unmacaque at gmail dot com>

pkgname=bign-handheld-thumbnailer
pkgver=1.2.1
pkgrel=1
pkgdesc='A thumbnailer for Nintendo handheld systems (Nintendo DS and 3DS) roms and files'
url='https://github.com/MateusRodCosta/bign-handheld-thumbnailer/'
license=('GPL-2.0-or-later')
makedepends=('cargo' 'meson' 'ninja')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MateusRodCosta/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('351988e8f8bf695d01f086663e0bd3617a4dc0c820152886571a4252e35893de')

build() {
  cd "$pkgname-$pkgver"
  meson setup _build -Dprefix=/usr
  meson compile -C _build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C _build --destdir "$pkgdir"
}
