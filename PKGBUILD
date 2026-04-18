# Maintainer: Muhammed Emin Akalan <muhammedeminakalan@akalan.dev>

pkgname=nocturne
pkgver=0.9.7
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
)

makedepends=(
  'blueprint-compiler'
  'meson'
)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/Jeffser/Nocturne/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('debdda29b1fb81d98769419d8349a8b0520b9c921649f06325c57eb9060b5424')

build() {
  cd "Nocturne-$pkgver"
  
  arch-meson build
  meson compile -C build
}

package() {
  cd "Nocturne-$pkgver"
  
  DESTDIR="$pkgdir" meson install -C build
}
