# Maintainer: Robert Manner <the_manni at users.sf.net>

pkgname=widgie
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight widget library for applications which do not need a splashscreen."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/manner/widgie"
license=('GPL3')
conflicts=('widgie-git')
depends=()
optdepends=("ttf-nerd-fonts-symbols-1000-em: (or a nerd font) for icon support")
makedepends=(wayland-protocols wayland libxkbcommon freetype2 libxkbcommon-x11 libxcb xcb-util-image xorgproto)
source=("https://gitlab.com/manner/widgie/-/archive/$pkgver/widgie-$pkgver.tar.gz")
sha256sums=('7cbaa0b28b464eecd7328c9c1a503b2bf7f7f9bf7d0bc337429368439075a552')

build() {
  cd "$pkgname-$pkgver"
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/usr" install
}
