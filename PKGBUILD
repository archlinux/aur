# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=aurutils-extra-git
pkgver=r86.c175268
pkgrel=1
pkgdesc="carlsmedstad’s custom aurutils scripts"
arch=('any')
url="https://github.com/carlsmedstad/aurutils-extra"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd aurutils-extra
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd aurutils-extra
	sed -i 's/PROGNM =/PROGNM ?=/' Makefile
}

package() {
    cd aurutils-extra
	PREFIX="$pkgdir/usr" PROGNM=$pkgname make install
}
