# Maintainer: JL2210 <larrowe.semaj11@gmail.com>

pkgname=bmfdec-git
pkgver=r50.c7b72f6
pkgrel=1
pkgdesc="Decompile binary MOF file (BMF) from WMI buffer (git master)"
arch=(x86_64)
url="https://github.com/pali/bmfdec"
license=('GPL-2.0-only')
depends=('glibc')
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C "${pkgname%-git}"
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname%-git}"/bmf{2mof,dec,parse}
}
