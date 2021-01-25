# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=3.9.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/InternetRadioLocator"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python' 'meson')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a3d1d1b4fbd63dd7bdc01360afaaae25c85f5739b7de5462e06177276e1b2be5')

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
