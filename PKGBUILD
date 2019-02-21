# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=howl
pkgver=0.5.3
pkgrel=2
pkgdesc='General purpose, light-weight customizable editor'
arch=(x86_64)
url='https://howl.io/'
license=(MIT)
depends=(desktop-file-utils gtk3)
source=("https://github.com/howl-editor/howl/releases/download/$pkgver/howl-$pkgver.tgz")
sha256sums=('7b0055908f57f27b30f20f7baec6302b0ba368ca3f30ccd655bc2258f246cc3e')

build() {
  make -C howl-$pkgver/src
}

package() {
  make -C howl-$pkgver/src PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 howl-$pkgver/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# getver: howl.io
# vim: ts=2 sw=2 et:
