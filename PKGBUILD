# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=libupnpp
pkgver=0.22.4
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(LGPL2.1)
depends=(libnpupnp expat)
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('37deca94176df8becead110a0b5cd11fe1f9c1c351e4c15a05570bf1c6fec09c')

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
