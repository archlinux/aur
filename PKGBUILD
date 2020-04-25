# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnpupnp
pkgver=2.1.2
pkgrel=1
pkgdesc="C++ base UPnP library, derived from Portable UPnP, a.k.a libupnp"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(BSD)
depends=(expat)
source=("https://framagit.org/medoc92/npupnp/-/archive/libnpupnp-v${pkgver}/npupnp-libnpupnp-v${pkgver}.tar.gz")
sha256sums=('0eba9cdfda4799c8d69c99fc8769f9321425921121f24139a219d2c9e3bcd896')

build(){
  cd "npupnp-${pkgname}-v${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package(){
  cd "npupnp-${pkgname}-v${pkgver}"
  make DESTDIR="$pkgdir" install
}
