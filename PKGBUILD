# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_pkgname=assfonts

pkgname="${_pkgname}-bin"
pkgver=v0.6.1
pkgrel=1
pkgdesc="Subset fonts and embed them into an ASS subtitle."
arch=('x86_64')
url="https://github.com/wyzdwdz/assfonts"
license=('GPL-3.0')
# changelog='share/doc/assfonts/NEWS'
source=("https://github.com/wyzdwdz/${_pkgname}/releases/download/$pkgver/${_pkgname}-$pkgver-$CARCH-Linux.tar.gz")
sha256sums=('5f58ac1239023ec0a0394d9f16ed9f4ca3c671c79c7702a72b78ec3e15ad1d76')

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	# cd "$pkgname-$pkgver"
	install -Dm755 "${srcdir}/assfonts-gui.AppImage" "${pkgdir}/usr/bin/assfonts-gui"
	install -Dm755 "${srcdir}/bin/assfonts" "${pkgdir}/usr/bin/assfonts"

	install -dm755 "${pkgdir}/usr"
	cp -a "${srcdir}/share" "${pkgdir}/usr"
}
