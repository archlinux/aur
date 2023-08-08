#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=ssocr
pkgver=2.23.1
pkgrel=1
pkgdesc="Seven Segment Optical Character Recognition"
arch=(x86_64)
url="https://www.unix-ag.uni-kl.de/~auerswal/ssocr/index.html"
license=('GPL3')
depends=(imlib2)
makedepends=(pkg-config)
source=("${pkgname}.${pkgver}.tar.gz::https://github.com/auerswal/ssocr/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('55f89ca825b2ec9e13c6f8e65139407f8cb49e57d31070f258cd60a4eeca386a'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
