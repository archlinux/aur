#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=xsys35c
pkgver=1.13.0
pkgrel=1
pkgdesc="System 3.x Compiler and Decompiler"
arch=(x86_64)
url="https://github.com/kichikuou/xsys35c"
license=('GPL-2.0-only')
depends=(libpng)
makedepends=(meson asciidoctor git)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
build() {
	cd "$srcdir/${pkgname}"
	meson setup build --prefix /usr
	ninja -C build
}

package() {
  cd "$srcdir/${pkgname}"
  DESTDIR="$pkgdir" ninja -C build install
}
