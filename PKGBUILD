# Maintainer: fengkx <liangkx8237@gmail.com>
pkgname=gotranslator-git
_pkgname_raw=translator
pkgver=r39.c6ba9b8
pkgrel=1
pkgdesc="多引擎支持命令行翻译工具 in Go"
arch=(any)
url="https://github.com/fengkx/translator"
license=('LGPL-3.0')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fengkx/translator.git')
md5sums=('SKIP')

pkgver() {
	cd "translator"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${_pkgname_raw}"
	make build
}

package() {
	cd "$srcdir/${_pkgname_raw}"
	install -Dm644 "$srcdir/${_pkgname_raw}/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm +x "tl" ${pkgdir}/usr/bin/tl
}
