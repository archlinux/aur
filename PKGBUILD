# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="otf-monaspace-bin"
_pkgbase=${pkgname%-bin}
pkgver="v1.100"
pkgrel=1
pkgdesc="An innovative superfamily of fonts for code"
arch=("any")
conflicts=("${pkgname%-bin}")
url="https://monaspace.githubnext.com"
license=("OFL")

source=("https://github.com/githubnext/monaspace/releases/download/${pkgver}/monaspace-${pkgver}.zip")
sha256sums=('c8f7e1a497cc128181d399b259b51e6fe332f7d0fed1fbb49bb05076a7753a9f')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF/${_pkgbase#"otf-"}"
	install -Dm644 "$srcdir/monaspace-${pkgver}/fonts/otf/"*.otf "$pkgdir/usr/share/fonts/OTF/${_pkgbase#"otf-"}"
	install -Dm644 "$srcdir/monaspace-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgbase#"otf-"}/LICENSE"
}
