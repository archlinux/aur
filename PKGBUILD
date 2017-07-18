# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl
pkgver=0.5.1
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=('x86_64' 'i686')
url='http://howl.io/'
license=('MIT')
depends=('gtk3' 'desktop-file-utils')
source=("https://github.com/howl-editor/howl/releases/download/$pkgver/howl-$pkgver.tgz")
sha256sums=('a714f1252dc6878fa640291e8ed36a336f8d00bce7ca7aab64e65ab04c56201c')

build() {
  make -C "howl-$pkgver/src"
}

package() {
  make -C "howl-$pkgver/src" PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 "howl-$pkgver/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim: ts=2 sw=2 et:
