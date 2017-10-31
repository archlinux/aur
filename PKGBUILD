# Maintainer: Tmplt <tmplt@dragons.rocks>
pkgname=katriawm
pkgver=17.10
pkgrel=1
pkgdesc="A non-reparenting, dynamic window manager for X11 with decorations"
arch=("i686" "x86_64")
url="https://github.com/vain/${_pkgname}"
license=("MIT")
makedepends=("git" "pkg-config")
depends=("libx11" "libxft" "libxrandr")
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("b2ab81a39292159accbc8d49f5afb4de8a670bb36e278e2162e2eb44ce57275e")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make DESTDIR=${pkgdir} PREFIX=/usr MANPREFIX=/usr/share/man install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
