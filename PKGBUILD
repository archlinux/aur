# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=deutex
pkgver=5.1.0
pkgrel=1
pkgdesc="Composer and decomposer for Doom, Heretic, Hexen, Strife WAD files"
arch=('x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('asciidoc')
conflicts=('deutex-git')
source=($url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('9fa143967fb8ccf01d004af6957ef8cc5381b7a6f2e316e54574d8974f815b83ce9e4562d820ec99003b0bb397321bfb74f44a54f839c87682743381d58274ff'
            'SKIP')
validpgpkeys=('99459CE2770037FF5566EB4B8649B37607A08042')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
