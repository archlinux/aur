# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr-zig
pkgver=1.0.0
pkgrel=1
pkgdesc="hr in zig"
arch=('i686' 'x86_64')
url="https://github.com/djmattyg007/hr-zig"
license=('custom:Public Domain')
source=("https://github.com/djmattyg007/hr-zig/archive/${pkgver}.tar.gz")
sha512sums=("6574abeb70b855ddb5c8002ffaf7340efc1b029d2998fcfb08faddd455efd5594355762253ad14fb1f64a3db569afe42175df43bd99a710fb447bd0d4371ca63")
conflicts=("hr")
provides=("hr")

build() {
    cd "${srcdir}/hr-zig-${pkgver}"
    zig build install -Drelease-small
}

package() {
    cd "${srcdir}/hr-zig-${pkgver}"
    zig build install -Drelease-small --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr-zig/LICENSE.txt"
}
