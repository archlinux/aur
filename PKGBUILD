# Maintainer: pandaxtc <uixtd883a@mozmail.com>

_gitname='kara'
pkgname="plasma6-applets-${_gitname}-git"
pkgver=0.7.3.r2.g7d2d305
pkgrel=1
pkgdesc='KDE Plasma Pager Applet'
url='https://github.com/dhruv8sh/kara'
license=('GPL-3.0-only')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(
    'git'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_gitname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    _pkgdir="${pkgdir}/usr/share/plasma/plasmoids/org.dhruv8sh.kara"
    mkdir -p "${_pkgdir}"
    cp -r "${_gitname}"/* "${_pkgdir}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${_gitname}"/LICENSE
}
