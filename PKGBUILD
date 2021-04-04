# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=b63-git
pkgver=r33.26ce28b
pkgrel=1
pkgdesc='Light-weight micro-benchmarking tool for C'
arch=('any')
url='https://github.com/okuvshynov/b63'
license=('Apache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/okuvshynov/b63.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname%-git}"
	install -dm755 "$pkgdir/usr/include"
	cp -dr --no-preserve=ownership src "$pkgdir/usr/include/b63"
}
