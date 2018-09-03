# Maintainer: dadav <33197631+dadav@users.noreply.github.com>

pkgname=tmpltr
pkgver=0.8
pkgrel=1
pkgdesc="This tool creates templates from logfiles and shows anomalies"
arch=('x86_64')
url="https://github.com/rondilley/tmpltr"
license=('GPL')
makedepends=('automake' 'autoconf')
provides=('tmpltr')
source=("https://github.com/rondilley/tmpltr/archive/v${pkgver}.zip")
sha256sums=('3aa84ba0e95321fcf78c6f668a1a91475ec8338b303bbcf49fe3626991a063cd')

build() {
  cd "${pkgname}-${pkgver}"
  ./bootstrap
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
