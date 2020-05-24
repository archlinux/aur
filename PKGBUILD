# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=libnpupnp
pkgver=4.0.3
pkgrel=1
pkgdesc="C++ base UPnP library, derived from Portable UPnP, a.k.a libupnp"
url="https://www.lesbonscomptes.com//upmpdcli/libupnpp-refdoc/libupnpp-ctl.html"
arch=(x86_64 i686 armv6h armv7h aarch64)
license=(BSD)
depends=(expat)
source=("https://framagit.org/medoc92/npupnp/-/archive/libnpupnp-v${pkgver}/npupnp-libnpupnp-v${pkgver}.tar.gz")
sha256sums=('ed7367102315c5f37e99ccadd44ec29e367c4b08cc42e50767a730f88bd2aa18')

prepare() {
  cd "npupnp-${pkgname}-v${pkgver}"
  ./autogen.sh
}

build(){
  cd "npupnp-${pkgname}-v${pkgver}"
  ./configure --prefix=/usr
  make
}

package(){
  cd "npupnp-${pkgname}-v${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
