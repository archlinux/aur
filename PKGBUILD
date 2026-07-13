#Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=matcha-idle-inhibitor
_pkgname=matcha
pkgver=2.1.0
pkgrel=1
pkgdesc="An Idle Inhibitor for Wayland"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/QuincePie/matcha"
license=('MIT')
depends=('wayland')
makedepends=('meson' 'ninja' 'git' 'wayland-protocols')
provides=('matcha')
conflicts=('matcha')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1debbc362e428ed4556e57ab0419e29d3531703bfc3d11bd6417a2f689cb39f3')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
