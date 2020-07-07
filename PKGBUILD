# Maintainer: Robin Broda <robin at broda dot me>

pkgname=hq
pkgver=3.1
pkgrel=2
pkgdesc='HTML processor inspired by jq'
arch=('x86_64')
url='https://github.com/coderobe/hq'
license=('AGPL3')
depends=('gcc-libs' 'modest')
makedepends=('git' 'meson')
source=("git+${url}#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cd "${pkgname}"

	arch-meson build
	ninja -C build
}

package() {
	cd "${pkgname}"

	install -Dm755 "build/hq" "${pkgdir}/usr/bin/hq"
}
