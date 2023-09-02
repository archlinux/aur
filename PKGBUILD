# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mini-text
pkgdesc='A very small and basic text editor'
pkgver=0.1.8
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://github.com/Nokse22/mini-text"
license=('GPL3')
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
