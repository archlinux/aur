# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnpupnp
pkgver=4.0.14
pkgrel=1
pkgdesc="C++ base UPnP library, derived from Portable UPnP, a.k.a libupnp"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(BSD)
depends=(expat)
source=("https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-${pkgver}.tar.gz")
sha256sums=('ea5f5bf388bf8c028a25630c58e9a42762fddd357e7e2581b192856e01aad044')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
