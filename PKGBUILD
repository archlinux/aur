# Maintainer: Benjamin Bukowski <benjamin.bukowski@googlemail.com>

pkgname=wavbreaker
pkgver=0.13
pkgrel=1
pkgdesc="A GTK wave file splitter"
arch=('x86_64' 'i686')
url="http://wavbreaker.sourceforge.net/"
license=('GPL')
depends=('libpulse' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme')
makedepends=('meson')
optdepends=('pulseaudio')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/thp/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('cc32a1afd0b52692a81ce7895b5ee767')

build() {
  meson --prefix /usr --buildtype=plain "$srcdir/$pkgname-$pkgver" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
