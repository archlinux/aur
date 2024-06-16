# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=dbus-term-launcher
pkgver=0.1.2
pkgrel=2
pkgdesc="Wrapper program to launch arbitrary terminal with Terminal intent API"
url='https://gitlab.com/thayne/dbus-term-launcher'
license=(Apache-2.0)
arch=(x86_64)
depends=(glib2 glibc)
optdepends=('alacritty: for alacritty launcher'
            'kitty: for kitty launcher'
            'xterm: for xterm launcher'
            'rxvt-unicode: for urxvt launcher')
makedepends=(meson glib2-devel)
source=(https://gitlab.com/thayne/dbus-term-launcher/-/archive/$pkgver/dbus-term-launcher-$pkgver.tar.gz)
sha256sums=('5c90b04251d80eabea4aac6190250a3b068649fb0c1021cda4302a0679a53105')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
