# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl
pkgver=0.5.2
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=('x86_64' 'i686')
url='http://howl.io/'
license=('MIT')
depends=('gtk3' 'desktop-file-utils')
source=("https://github.com/howl-editor/howl/releases/download/$pkgver/howl-$pkgver.tgz")
sha256sums=('1e651da48cd54464e1fd70b3cd306417c7c58ba6b3d0f7308be5b230371230d0')

build() {
  make -C "howl-$pkgver/src"
}

package() {
  make -C "howl-$pkgver/src" PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 "howl-$pkgver/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# getver: howl.io
# vim: ts=2 sw=2 et:
