# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# This pkgbuild is crafted by Subhan Gadirli <subhangadirli at protonmail dot com>

pkgname=nazar-blocker
pkgver=1.0
pkgrel=1
pkgdesc="System tray application for protection from the evil eye"
arch=('x86_64' 'aarch64')
url="https://github.com/SubhanGadirli/nazar-blocker-gtk"
license=('LicenseRef-IOSL')
depends=('gtk3' 'libayatana-appindicator')
makedepends=('meson' 'ninja' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SubhanGadirli/nazar-blocker-gtk/archive/v$pkgver.tar.gz")
sha256sums=('65f2c2cf1a6a66244c2b54dc9719ab8b468316841b8a75052bb2c4500f12361e')

build() {
  cd "$pkgname-gtk-$pkgver"
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "$pkgname-gtk-$pkgver"
  DESTDIR="$pkgdir" meson install -C builddir
}
