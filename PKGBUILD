#!/usr/bin/env bash
# Maintainer: Emil Tang Kristensen <emiltangkristensen@gmail.com>
pkgname=googleballs-desktop-gtk
pkgver=1.7.0
pkgrel=1
url="https://github.com/weeniemount/googleballs-app"
pkgdesc="Gtk version of google balls"
makedepends=(gcc)
arch=(x86_64)
license=('WTFPL')
source=("${pkgname}-${pkgversion}.tar.gz::https://github.com/weeniemount/googleballs-app/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8c9fa41eba0bce1c422f6b13f6b4b0a5511870e600651408608499a7852f999f')


prepare() {
	cd native-gtk	
}


build() {
	make release
}

package() {
	install -Dm755 "native-gtk/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
