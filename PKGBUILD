# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl
pkgver=0.3
pkgrel=1
pkgdesc='General purpose, light-weight customizable editor'
arch=('x86_64' 'i686')
url='http://howl.io/'
license=('MIT')
depends=('gtk3' 'desktop-file-utils')
install=howl.install
source=("https://github.com/howl-editor/howl/releases/download/$pkgver/howl-$pkgver.tgz")
sha256sums=('a0c8f24f0ea90aad5ce008c0091578998a07dd00897a3c02e138b175e81f3297')

build() {
  make -C "howl-$pkgver/src"
}

package() {
  make -C "howl-$pkgver/src" PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 "howl-$pkgver/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
