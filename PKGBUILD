# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=deutex
pkgver=5.2.2
pkgrel=1
pkgdesc="Composer and decomposer for Doom, Heretic, Hexen, Strife WAD files"
arch=('x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('asciidoc')
conflicts=('deutex-git')
source=($url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.zst)
b2sums=('ad290ce6792425ba7f643cfe6c09c1a3f040ad0a4c95822f9368592dde6d489d28e892a26d78f2ebfefa086c910c948ef37eb3a3047429605653b273f9b567a8')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
