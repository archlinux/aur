# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=3.9.2
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/InternetRadioLocator"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python' 'meson')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('f86c41d03f8093c40129a151a0a1449fa167563ce153102506a50f23df31f824')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check(){
  meson test -C build
}

package(){
  DESTDIR="$pkgdir" meson install -C build
}
