# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=catppuccin-konsole-colorscheme-git
pkgname=(catppuccin-konsole-colorscheme-{latte,frappe,macchiato,mocha}-git)
pkgver=r30.3b64040
pkgrel=1
pkgdesc="Soothing pastel theme for Konsole"
arch=('any')
url="https://github.com/catppuccin/konsole"
license=('MIT')
depends=('konsole')
makedepends=('git')
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgbase}"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package_catppuccin-konsole-colorscheme-latte-git() {
	install -Dm644 "${pkgbase}/themes/catppuccin-latte.colorscheme" "${pkgdir}/usr/share/konsole/catppuccin-latte.colorscheme"
	install -Dm644 "${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_catppuccin-konsole-colorscheme-frappe-git() {
	install -Dm644 "${pkgbase}/themes/catppuccin-frappe.colorscheme" "${pkgdir}/usr/share/konsole/catppuccin-frappe.colorscheme"
	install -Dm644 "${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_catppuccin-konsole-colorscheme-macchiato-git() {
	install -Dm644 "${pkgbase}/themes/catppuccin-macchiato.colorscheme" "${pkgdir}/usr/share/konsole/catppuccin-macchiato.colorscheme"
	install -Dm644 "${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_catppuccin-konsole-colorscheme-mocha-git() {
	install -Dm644 "${pkgbase}/themes/catppuccin-mocha.colorscheme" "${pkgdir}/usr/share/konsole/catppuccin-mocha.colorscheme"
	install -Dm644 "${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
