# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=dm-writeboost-tools
pkgver=1.0.0
pkgrel=1
pkgdesc="Nice tools for dm-writeboost"
arch=('i686' 'x86_64')
url="https://github.com/akiradeveloper/dm-writeboost-tools"
license=('GPL2')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("https://github.com/akiradeveloper/dm-writeboost-tools/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 target/release/wbcheck "${pkgdir}/usr/bin/wbcheck"
	install -Dm755 target/release/wbcreate "${pkgdir}/usr/bin/wbcreate"
	install -Dm755 target/release/wbdump "${pkgdir}/usr/bin/wbdump"
	install -Dm755 target/release/wbmeta "${pkgdir}/usr/bin/wbmeta"
	install -Dm755 target/release/wbremove "${pkgdir}/usr/bin/wbremove"
	install -Dm755 target/release/wbstatus "${pkgdir}/usr/bin/wbstatus"
}

md5sums=('eddcb1757a64100c2289b1e8f9c7e564')
