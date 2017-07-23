# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

_pkgver=5.0.0-beta.2
pkgname=deutex
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc="Composer and decomposer for Doom, Heretic, Hexen, Strife WAD files"
arch=('x86_64')
url="https://github.com/Doom-Utils/deutex"
license=('GPL2')
depends=('libpng')
makedepends=('asciidoc')
conflicts=('deutex-git')
source=($url/releases/download/v${_pkgver}/${pkgname}-${_pkgver}.tar.xz{,.sig})
sha512sums=('d0de9c85cf5fe8fbaa02c5adfbc19af2c7b9a1b78ea7c2a2133d543d7a72e6f89cc303a3e0f6d697c016e83c47cc7a53444fad53cc2dd87a1deb7fff81874241'
            'SKIP')
validpgpkeys=('99459CE2770037FF5566EB4B8649B37607A08042')

build() {
  cd "$pkgname-$_pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$_pkgver"
  make DESTDIR="$pkgdir/" install
}
