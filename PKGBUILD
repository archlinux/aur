# Maintainer: Gaurav Atreya <allmanpride at gmail dot com>
pkgname=numrng
pkgver=0.1
pkgrel=1
pkgdesc="Terminal Command to generate list of numbers from human readable representation"
arch=('x86_64')
url="https://github.com/Atreyagaurav/${pkgname}"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Atreyagaurav/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('87d3f4cfd3818896582b66a00ab927c69821420c6dfbc5ee30a6d9a0d508cd1e')
options=(strip !debug)


build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p "$pkgdir/usr/bin"
    cp "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
