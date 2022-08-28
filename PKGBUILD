# Maintainer: oldNo.7 <oldNo.7@archlinux.org>
pkgname=mmv-c-git
_binname=mmv
pkgver=0.1.0
pkgrel=1
pkgdesc="Rename multiple files with editor like to mmv-go"
arch=(i686 x86_64)
url='https://github.com/mcauley-penney/mmv-c'
license=("MIT")
depends=()
makedepends=('gcc' 'make')
conflicts=('mmv' 'mmv-go-git' 'mmv-go-bin-git' 'mmv-c')
provides=('mmv')
source=('git+https://github.com/mcauley-penney/mmv-c.git')
sha256sums=('SKIP')

build() {
	cd "$srcdir/mmv-c"
	make
}

check() {
	cd "$srcdir/mmv-c"
	make test
}

package() {
	cd "$srcdir/mmv-c"
	install -Dm755 "${_binname}" "$pkgdir/usr/bin/${_binname}"
	install -Dm644 "README.md"   "$pkgdir/usr/share/doc/${_binname}/README.md"
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
