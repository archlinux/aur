# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="otf-monaspace-bin"
_pkgbase=${pkgname%-bin}
pkgver="v1.101"
pkgrel=1
pkgdesc="An innovative superfamily of fonts for code"
arch=("any")
conflicts=("${pkgname%-bin}")
url="https://monaspace.githubnext.com"
license=("OFL")

source=("https://github.com/githubnext/monaspace/releases/download/${pkgver}/monaspace-${pkgver}.zip")
sha256sums=('7ff2317c7bdaed8e81dcbe1314e6ab12ad9641b7ddf921e996a227ff4ec7752f')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF/${_pkgbase#"otf-"}"
	install -Dm644 "$srcdir/monaspace-${pkgver}/fonts/otf/"*.otf "$pkgdir/usr/share/fonts/OTF/${_pkgbase#"otf-"}"
	install -Dm644 "$srcdir/monaspace-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgbase#"otf-"}/LICENSE"
}
