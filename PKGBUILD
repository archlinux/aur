# Maintainer: Wojciech Duda <rivioxyt@hotmail.com>
pkgname=hypr-zoom
pkgver=0.0.2
pkgrel=1
pkgdesc="A zoom feature for Hyprland"
arch=('x86_64')
url="https://github.com/FShou/hypr-zoom"
license=('MIT')
depends=('ffmpeg')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FShou/hypr-zoom/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

pkgver() {
  echo "$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  go build -o hypr-zoom
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/hypr-zoom" "$pkgdir/usr/bin/hypr-zoom"
}
