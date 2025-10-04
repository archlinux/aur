# Maintainer: Oscar Rodriguez a.k.a mester <mester@disroot.org> 
pkgname="arashi-icon-theme"
pkgver=25.10
pkgrel=2
arch=("any")
license=('CC-BY-4.0')
pkgdesc="Arashi a smooth, modern icon set with a twist!"
url="https://github.com/0hStormy/Arashi"
provides=("arashi-icon-theme")
depends=()
options=('!strip' '!debug')

source=(Arashi-$pkgver::"$url/releases/download/$pkgver/Arashi-$pkgver.zip")

sha256sums=("39386145008857c88b369688a5f03d0da0a0c85c8634c344e8ccb22ede80a4a2")

package() {
	rm -rf "${srcdir}/Arashi-$pkgver/.github"
	rm -rf "${srcdir}/Arashi-$pkgver/.git"
	rm -rf "${srcdir}/Arashi-$pkgver/README.md"
	find "${srcdir}/Arashi-$pkgver" -type f -name "*.png" -delete
	install -Dm644 "${srcdir}/Arashi-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${srcdir}/Arashi-$pkgver/LICENSE"
	install -d -m755 "${pkgdir}/usr/share/icons/Arashi"
	cp -r "${srcdir}/Arashi-$pkgver/"* "${pkgdir}/usr/share/icons/Arashi/"
}
