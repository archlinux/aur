# Maintainer: Oscar Rodriguez a.k.a mester <mester@disroot.org> 
pkgname="arashi-icon-theme"
pkgver=25.09
pkgrel=2
arch=("any")
license=('CC-BY-4.0')
pkgdesc="Arashi a smooth, modern icon set with a twist!"
url="https://github.com/0hStormy/Arashi"
provides=("arashi-icon-theme")
depends=()
options=('!strip' '!debug')

source=(Arashi-$pkgver::"$url/releases/download/$pkgver/Arashi-$pkgver.zip")

sha256sums=("20cfb7d720b0fa261f34007c1c7a56f06309798033f56cc531a474d5fbf00ac2")

package() {
	rm -rf "${srcdir}/Arashi-$pkgver/.github"
	rm -rf "${srcdir}/Arashi-$pkgver/.git"
	find "${srcdir}/Arashi-$pkgver" -type f -name "*.png" -delete
	rm "${srcdir}/Arashi-$pkgver/README.md"
	install -d -m755 "${pkgdir}/usr/share/icons/Arashi"
	install -Dm644 "${srcdir}/Arashi-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${srcdir}/Arashi-$pkgver/LICENSE"
	cp -r "${srcdir}/Arashi-$pkgver/"* "${pkgdir}/usr/share/icons/Arashi/"
}
