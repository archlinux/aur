# Maintainer: fiskhest <johan+bspi at radivoj dot se>
# Maintainer: hq1 <hq at mtod dot org>

_pkgname=bspi
pkgname=${_pkgname}-git
pkgver=r15.ed6d090
pkgrel=1
pkgdesc='Icons for bspwm, sort of'
arch=('any')
url="https://github.com/fiskhest/aur-${pkgname}"
license=('BSD')
install=${pkgname}.install
depends=('bspwm' 'xorg-xprop' 'ttf-font-awesome' 'python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/aerosol/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"
    install -D -m 755 -t "${pkgdir}/usr/bin" bspi.py bspi_listen
    install -D -m 644 bspi.ini "${pkgdir}/usr/share/doc/${_pkgname}/bspi.ini"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

