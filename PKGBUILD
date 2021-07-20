# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=dbus-term-launcher
pkgver=0.1.1
pkgrel=1
pkgdesc="Wrapper program to launch arbitrary terminal with Terminal intent API"
url='https://gitlab.com/thayne/dbus-term-launcher'
license=(Apache)
arch=(x86_64)
depends=(glib2)
optdepends=('alacritty: for alacritty launcher'
            'kitty: for kitty launcher'
            'xterm: for xterm launcher'
            'rxvt-unicode: for urxvt launcher')
makedepends=(meson)
source=(https://gitlab.com/thayne/dbus-term-launcher/-/archive/$pkgver/dbus-term-launcher-$pkgver.tar.gz)
sha256sums=('19851c5aa87ec6100fa4adfb55910a1f2832f35db18bf6c1ca21eb851cc974ec')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
