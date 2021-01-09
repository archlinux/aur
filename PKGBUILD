# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-internet-radio-locator
pkgver=3.8.0
pkgrel=1
pkgdesc="Easily find live radio programs based on geographical location of radio broadcasters on the Internet"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/InternetRadioLocator"
license=(GPL3)
depends=('libchamplain' 'geoclue' 'gst-plugins-base' 'gst-plugins-bad')
makedepends=('intltool' 'itstool' 'python' 'meson')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('ae9e22909afcd799679a90b45fcc82fa38007c35b38d79d30f63f225e6d2b5ae')

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
