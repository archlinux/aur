# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Robin Appelman <robin@icewind.nl>
# Contributor: micouy <m.powierza@tutanota.com>

pkgname=kn
pkgver=0.3.2
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="cd alternative. Navigate by typing abbreviation of paths."
license=('MIT')
url="https://github.com/micouy/kn"
_archive="${pkgname}-${pkgver}"
source=("${_archive}.tar.gz::https://github.com/micouy/kn/archive/refs/tags/v${pkgver}.zip"
				"kn.install")
sha256sums=('a2d060349c8cdfcb05a32fbf5784ec20339c9e3e2b06a36d38fefb967a24fbd6'
            '31764827f922661294ecaa64d4a705cc10235a1a5a47af8310e02594ad5c14d6')
install="kn.install"

build() {
    cd "${_archive}"
    cargo build --release
}

package() {
    cd "${_archive}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/_kn"
}
