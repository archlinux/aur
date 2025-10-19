#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=sys3c
pkgver=0.4.0
pkgrel=1
pkgdesc="System 1-3 Compiler and Decompiler"
arch=(x86_64)
url="https://github.com/kichikuou/sys3c"
license=('GPL-2.0-only')
depends=(glibc)
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
