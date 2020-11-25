# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tristelune <tristelune@archlinux.info>

pkgname=libupnpp
pkgver=0.19.4
pkgrel=1
pkgdesc="A C++ wrapper for libupnp - used with upmpdcli or upplay"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(LGPL2.1)
depends=(libnpupnp expat)
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('29d1d07d44c8f79573e64e093ad8f0f883b11ef9eb3642a67aa703c1dde60576')

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
