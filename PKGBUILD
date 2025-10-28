# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr-zig
pkgver=1.0.2
pkgrel=1
pkgdesc="hr in zig"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/djmattyg007/hr-zig"
license=('Unlicense')
depends=("glibc")
makedepends=("zig")
conflicts=("hr")
provides=("hr")
source=("https://github.com/djmattyg007/hr-zig/archive/v${pkgver}.tar.gz")
sha512sums=('fe116b38d382a14d156cfbd3723507121c7db073bed7f6620b471ac554c00eb81780acccc5963bf624be74bdb0125fe1b9c98d8d4b472d8b6d7642d1d8cd0836')

build() {
    cd "${srcdir}/hr-zig-${pkgver}"

    zig build -Doptimize=ReleaseSmall
}

package() {
    cd "${srcdir}/hr-zig-${pkgver}"

    zig build install -Doptimize=ReleaseSmall --prefix "${pkgdir}/usr"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr-zig/LICENSE.txt"
}
