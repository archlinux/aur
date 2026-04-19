# Maintainer: Muhammed Emin Akalan <muhammedeminakalan@akalan.dev>

pkgname=nocturne
_name=Nocturne
pkgver=0.9.7
pkgrel=2

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
)

makedepends=(
  'blueprint-compiler'
  'meson'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Jeffser/$_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('debdda29b1fb81d98769419d8349a8b0520b9c921649f06325c57eb9060b5424')

build() {
  cd "$_name-$pkgver"
  
  arch-meson build
  meson compile -C build
}

package() {
  cd "$_name-$pkgver"
  
  DESTDIR="$pkgdir" meson install -C build
}
