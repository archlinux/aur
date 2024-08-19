# Maintainer: Sebastian Muxel <sebastian@muxel.dev>
# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2024.08.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python' 'wget')
source=("https://public.pengutronix.de/software/ptxdist/${pkgname}-${pkgver}.tar.bz2")
md5sums=('2b9ed1e5ed2de7201065ceddde4085c1')
sha256sums=('d94963c4a6cc3d994713f90bff032121d68e191536239dd53775930b961bdf23')
sha512sums=('f9e426d19ea4e298dfcb9afb56a95413cfbf169d7d90a316b2884efdf9bd9073f9bfbcd1e5b391208753cd70cc54de76337c4624637842e6ad11132f276aa4e4')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
