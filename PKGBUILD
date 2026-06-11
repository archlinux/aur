# Maintainer : Michael Herstine <sp1ff at pobox dot com>
pkgname=mpdpopm
pkgver=0.3.6
pkgrel=1
pkgdesc='Maintain ratings & playcounts for your mpd server'
url=https://github.com/sp1ff/mpdpopm
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=("gcc-libs" "glibc")
makedepends=("base-devel" "cargo" "texinfo")
source=("https://github.com/sp1ff/mpdpopm/releases/download/$pkgver/mpdpopm-$pkgver.tar.gz")
sha256sums=('77b0d2d36fa1263a00ebca171074ee8f3f8bd78ab7005736a8cd662552dab833')

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
