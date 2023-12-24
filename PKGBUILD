# Maintainer: Kud Lain <kasa7qi at gmail dot com>
pkgname=ord
pkgver=0.13.1
pkgrel=1
epoch=
pkgdesc="an index, block explorer, and command-line wallet"
arch=('x86_64')
url="https://github.com/ordinals/ord"
license=('CC0-1.0')
depends=(glibc gcc-libs)
makedepends=(rust git)
provides=(ord)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/target/release/ord -t "${pkgdir}/usr/bin/"
}
