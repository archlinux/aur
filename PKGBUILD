# Maintainer: Luca Saccarola <aur.sdx1a@simplelogin.com>
pkgname='kara-git'
pkgver=r24.7d2d305
pkgrel=1
pkgdesc="KDE Plasma Pager Applet"
arch=(any)
url="https://github.com/dhruv8sh/kara"
license=('GPL-3.0')
makedepends=('git')
install='install.sh'
source=('git+https://github.com/dhruv8sh/kara.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    _pkgdir="${pkgdir}/usr/share/plasma/plasmoids/org.dhruv8sh.kara"
    mkdir -p "${_pkgdir}"
    cp -r kara/* "${_pkgdir}"
}
