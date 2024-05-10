# Maintainer : Michael Herstine <sp1ff at pobox dot com>
pkgname=mpdpopm
pkgver=0.3.3
pkgrel=1
pkgdesc='Maintain ratings & playcounts for your mpd server'
url=https://github.com/sp1ff/mpdpopm
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=("gcc-libs" "glibc")
makedepends=("base-devel" "cargo" "texinfo")
source=("https://github.com/sp1ff/mpdpopm/releases/download/$pkgver/mpdpopm-$pkgver.tar.gz")
sha256sums=('56ef8fbf062845907f2dd7c26d19407363124019f9027b62e6c76668e4aad3e1')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
