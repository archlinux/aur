# Maintainer : Michael Herstine <sp1ff at pobox dot com>
pkgname=mpdpopm
pkgver=0.3.5
pkgrel=1
pkgdesc='Maintain ratings & playcounts for your mpd server'
url=https://github.com/sp1ff/mpdpopm
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=("gcc-libs" "glibc")
makedepends=("base-devel" "cargo" "texinfo")
source=("https://github.com/sp1ff/mpdpopm/releases/download/$pkgver/mpdpopm-$pkgver.tar.gz")
sha256sums=('a67a711c21132b937a79841858115b98f70b5fa8983a5b28a623a9b9b293df2f')

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
