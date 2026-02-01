# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=wallchemy
pkgver=1.0.6
pkgrel=1
pkgdesc='CLI tool for fetching wallpapers from wallhaven.cc'
arch=('x86_64' 'aarch64')
url=https://github.com/davenicholson-xyz/${pkgname}
license=('MIT')
depends=()
makedepends=('go')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c2952dcd05e08eb2efbd19c7ba3e5b2a5a6d5845e3a5a0f6ae523eba58dbe0d')
conflicts=('wallchemy-bin')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build
}
package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
