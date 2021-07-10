# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr-zig
pkgver=1.0.1
pkgrel=1
pkgdesc="hr in zig"
arch=("i686" "x86_64")
url="https://github.com/djmattyg007/hr-zig"
license=('custom:Public Domain')
depends=("glibc")
makedepends=("zig")
conflicts=("hr")
provides=("hr")
source=("https://github.com/djmattyg007/hr-zig/archive/${pkgver}.tar.gz")
sha512sums=("11c7e89584b7e45ec75ad08121d7542a1c7a743052c3333c4c4b31fedb11a50f1aa6a62f997aca74ea1b22211673786ba87581f9d67d8876590339491e55ae2e")

build() {
    cd "${srcdir}/hr-zig-${pkgver}"

    zig build install -Drelease-small
}

package() {
    cd "${srcdir}/hr-zig-${pkgver}"

    zig build install -Drelease-small --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr-zig/LICENSE.txt"
}
