# Maintainer: witt <1989161762 at qq dot com>
pkgname=typora-theme-drake-git
pkgver=2.9.6
pkgrel=1
pkgdesc="Material Google JetBrains Vue Juejin Purple Ayu Dark ."
arch=('any')
url="https://github.com/liangjingkanji/DrakeTyporaTheme"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=(
    'git'
)
optdepends=('ttf-jetbrains-mono-git: 适合开发人员的编程字体'
    'otf-fira-code-git: 前端开发人员喜欢用的字体'
    'ttf-delugia-code: 微软官方字体, Windows Terminal的默认字体'
    'ttf-sarasa-gothic-sc: 更紗黑體, 超窄字间距(稍微过窄)'
)
install="${pkgname%-git}.install"
source=(
    "${pkgname%-git}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

package() {
    install -Dm644 "${srcdir}/${pkgname%-git}/"*.css -t "${pkgdir}/${HOME}/.config/Typora/themes"
    install -Dm644 "${srcdir}/${pkgname%-git}/drake/"*.css -t "${pkgdir}/${HOME}/.config/Typora/themes/drake"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
