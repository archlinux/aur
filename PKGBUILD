# Maintainer: Veillain <veillainwertz@gmail.com>
pkgname=dotman
pkgver=0.1.5.r0.g6f095db
pkgrel=1
pkgdesc="Very lightweight and simple Dotfile Manager, fully written in bash."
arch=("any")
url="https://github.com/veillain/dotman"
license=("GPL-3.0-or-later")
depends=("git")
provides=("dotman")
conflicts=("dotman")
source=("${pkgname}-${pkgver}::git+https://github.com/veillain/dotman.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}-${pkgver}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}-${pkgver}"
    install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm755 src/${pkgname} -t "${pkgdir}/usr/bin/"
}
