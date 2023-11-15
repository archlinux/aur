# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="otf-monaspace-bin"
_pkgbase=${pkgname%-bin}
pkgver="v1.000"
pkgrel=1
pkgdesc="An innovative superfamily of fonts for code"
arch=("any")
conflicts=("${pkgname%-bin}")
url="https://monaspace.githubnext.com"
license=("OFL")

source=("https://github.com/githubnext/monaspace/releases/download/${pkgver}/monaspace-${pkgver}.zip")
sha256sums=('3e08376fd0aeca1f851fde0c08e18ca2d797f6a4c7a449670bf4d1270303c8f6')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF/${_pkgbase#"otf-"}"
	install -Dm644 "$srcdir/monaspace-${pkgver}/fonts/otf/"*.otf "$pkgdir/usr/share/fonts/OTF/${_pkgbase#"otf-"}"
	install -Dm644 "$srcdir/monaspace-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgbase#"otf-"}/LICENSE"
}
