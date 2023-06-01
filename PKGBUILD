# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="sysinfo"
pkgver="0.1.0"
pkgrel="2"
pkgdesc="sysinfo shows system information like the hardware configuration and resource usage in a compact, clearly arranged and
visually pleasing style."
arch=("any")
url="https://github.com/IngoMeyer441/sysinfo"
license=("MIT")
depends=("bash" "gawk")
source=("https://github.com/IngoMeyer441/sysinfo/archive/v${pkgver}.tar.gz")
sha256sums=("250e8a5f6242511f70d2b6c2f7928199ae70612227fa8e41190fae428dd4afa0")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
