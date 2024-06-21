# Maintainer: Thayne McCombs <astrothayne at gmail dot com>
pkgname=dbus-term-launcher
pkgver=0.1.3
pkgrel=3
pkgdesc="Wrapper program to launch arbitrary terminal with Terminal intent API"
url='https://gitlab.com/thayne/dbus-term-launcher'
license=(Apache-2.0)
arch=(x86_64)
depends=(glib2 glibc)
optdepends=('alacritty: for alacritty launcher'
            'kitty: for kitty launcher'
            'xterm: for xterm launcher'
            'rxvt-unicode: for urxvt launcher'
             'wezterm: for wezterm launcher')
makedepends=(meson glib2-devel python)
source=(https://gitlab.com/thayne/dbus-term-launcher/-/archive/$pkgver/dbus-term-launcher-$pkgver.tar.gz)
sha256sums=('a9edc814e920bf248c9a1745c110324d3e76672cce22ffba0508a624bf4f5b78')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
