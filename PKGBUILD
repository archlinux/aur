# Maintainer: witt <1989161762 at qq dot com>
pkgname=typora-theme-lapis-git
pkgver=1.2.0
pkgrel=3
pkgdesc="A clean Typora theme in blue tones ."
arch=('any')
url="https://github.com/YiNNx/typora-theme-lapis"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=(
    'git'
)
source=(
    "git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

package() {
    install -Dm644 "${srcdir}/${pkgname%-git}/lapis.css" -t "${pkgdir}/${HOME}/.config/Typora/themes"
    install -Dm644 "${srcdir}/${pkgname%-git}/lapis-dark.css" -t "${pkgdir}/${HOME}/.config/Typora/themes"
    install -Dm644 "${srcdir}/${pkgname%-git}/lapis/"* -t "${pkgdir}/${HOME}/.config/Typora/themes/lapis"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
