# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=raidgrep-bin
_pkgname=${pkgname/-bin/}
pkgver="1.2.0"
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
sha256sums=('8f0051f030e03e64f8381e4207861786087906b084034500ab4909f2b7888ff4')

package() {
    install -d ${pkgdir}/usr/bin/
    install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm 644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}

