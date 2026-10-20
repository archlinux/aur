# Maintainer: username227 <gfrank [at] gmail [dot] com>

pkgname=xenity
pkgver=3.44.6
pkgrel=1
pkgdesc="GTK3 drop-in replacement for Zenity 3.44"
arch=('x86_64')
url="https://github.com/xapp-project/xenity"
license=('LGPL-2.1-or-later')
depends=('gtk3' 'glib2' 'glibc' 'libx11')
makedepends=('git' 'meson' 'ninja' 'pkgconf')
conflicts=('xenity-git')
source=('git+https://github.com/xapp-project/xenity.git#tag=3.44.6')
sha256sums=('2333d148b17be362b72f6b8943e13e5314804b13dde1d0e94ae501c4b633fdbb')

build() {
  arch-meson xenity build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

