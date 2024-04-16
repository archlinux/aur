# Maintainer: Soramane <soramane32@gmail.com>

pkgname=ttf-gabarito-git
pkgver=v1.000.r8.g1f3fb39
pkgrel=1
pkgdesc='A light-hearted geometric sans typeface with 6 weights'
arch=('any')
url='https://github.com/naipefoundry/gabarito'
license=('OFL-1.1')
makedepends=('git')
provides=('ttf-gabarito')
conflicts=('ttf-gabarito')
source=("gabarito-git::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/gabarito-git"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}"/gabarito-git/fonts/ttf/*.ttf "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/gabarito-git/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
