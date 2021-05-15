# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=givemelyrics
pkgver=0.5.0
pkgrel=1
pkgdesc='See the lyrics of the song that is playing, from any application'
arch=('x86_64')
url='https://github.com/muriloventuroso/givemelyrics'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("https://github.com/muriloventuroso/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('574fdd887715cffeed814b53b2c745bd69260ca584712376ec2b10d3b5af8563')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
