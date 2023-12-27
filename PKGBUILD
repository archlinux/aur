# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=libupnpp
pkgver=0.25.0
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(LGPL2.1)
depends=(glibc gcc-libs curl expat libnpupnp)
provides=(libupnpp.so)
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3b26e4161ccb85b29e339416761c8cd5ba763012a4bf8b335b01966639c404be')

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  depends+=(libnpupnp.so)
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
