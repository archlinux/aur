# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>
pkgname=font-config-info-git
pkgver=r31.a274b37
pkgrel=1
pkgdesc="A tiny program that queries and prints a Linux system's font configuration"
arch=(x86_64)
url="https://github.com/derat/font-config-info"
license=('GPL')
depends=(gtk3 xsettingsd)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/derat/font-config-info.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm755 font-config-info "$pkgdir"/usr/bin/font-config-info
}
