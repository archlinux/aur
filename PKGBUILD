# Maintainer: Sebastian Muxel <sebastian@muxel.dev>
# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2024.01.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python' 'wget')
source=("https://public.pengutronix.de/software/ptxdist/${pkgname}-${pkgver}.tar.bz2")
md5sums=('d44d0877d666bfe573905b64f0b85ab8')
sha256sums=('00dc11a32175220aaa7a6d7780e001b6a4ac327b6d780962f95089aa6f7880f0')
sha512sums=('028aef74ce825c4afb8eaeb223944901873e3855f6c5eb827ebc9d5e008614bf1864b5207c77b1fa96ca026e9bf69cee1096cd09a1e262104cd45b7d93395643')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
