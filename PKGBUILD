# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=inspector
pkgdesc='Gives information about your system'
pkgver=0.1.6
pkgrel=1
arch=('any')
url="https://github.com/Nokse22/inspector"
license=('GPL3')
depends=('python' 'libadwaita')
makedepends=('git' 'meson')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson inspector build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
