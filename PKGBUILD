# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pomo
pkgver=0.6.0
pkgrel=1
epoch=
pkgdesc="Pomodoro CLI"
arch=(x86_64)
url="https://kevinschoon.github.io/pomo"
license=('MIT')
makedepends=(go)
source=("https://github.com/kevinschoon/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-linux-amd64")
md5sums=("97be4ccf66c4ae4e3e154f87b9bb0bf2")
noextract=("$pkgname-$pkgver-linux-amd64")

prepare() {
	mv "$pkgname-$pkgver-linux-amd64" pomo
	chmod +x pomo
}

package() {
	install -d "${pkgdir}/usr/bin"
	install pomo "${pkgdir}/usr/bin"
}
