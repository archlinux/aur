# Maintainer: Muhammed Emin Akalan <muhammedeminakalan@akalan.dev>

pkgname=nocturne
_name=Nocturne
pkgver=1.0.0
pkgrel=1

pkgdesc="Bring your music library together"
arch=('any')
url="https://github.com/Jeffser/Nocturne"
license=('GPL-3.0-or-later')

depends=(
  'libadwaita'
  'python-cairo'
  'python-colorthief'
  'python-favicon'
  'python-mpris_server'
  'python-pillow'
  'python-tinytag'
  'python-syncedlyrics'
)

makedepends=(
  'blueprint-compiler'
  'meson'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Jeffser/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5516930fa4199af575325b8f5919b707116575782976acf2957cac04a968aa8a')

build() {
  cd "$_name-$pkgver"
  
  arch-meson build
  meson compile -C build
}

package() {
  cd "$_name-$pkgver"
  
  DESTDIR="$pkgdir" meson install -C build
}
