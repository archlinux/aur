# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-bin
_pkgname=${pkgname/-bin/}
pkgver="1.5.0"
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log searching tool. Pre-compiled."
arch=("x86_64")
url="https://gitlab.com/dunj3/raidgrep"
license=("GPL")
provides=("raidgrep")
conflicts=("raidgrep" "raidgrep-git")
depends=("gcc-libs")
source=(
    "https://kingdread.de/raidgrep/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('8be605d8e2deb0615e70ab086c9b59b80699130fe25658c1d6de89bd60343633')

package() {
    install -d ${pkgdir}/usr/bin/
    install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}

