# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=nautilus-open-in-ide
pkgver=5
pkgrel=1
pkgdesc="A Nautilus extension that adds 'Open in' context menu items for installed IDEs"
arch=('any')
url="https://gitlab.com/rmnvgr/nautilus-open-in-ide"
license=('GPL-3.0-or-later')
depends=('nautilus-python')
makedepends=('meson')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('42220f7f7b1bbabf825d08b10db63217eb81ed3ad49ef9e2109e4cb3d13bdb3b')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
