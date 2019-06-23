# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=deutex
pkgver=5.2.0
pkgrel=1
pkgdesc="Composer and decomposer for Doom, Heretic, Hexen, Strife WAD files"
arch=('x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('asciidoc')
conflicts=('deutex-git')
source=($url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('5baa3e06e8562e36e9e520a52a7b4407277e7741deb543eb7b68587a9aab3f409c574415654e8a1ef15d2afb7750aa603189f8de749353666295c6a292b92a33'
            'SKIP')
validpgpkeys=('99459CE2770037FF5566EB4B8649B37607A08042')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
