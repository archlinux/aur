# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=aurutils-extra-git
_pkgname=${pkgname%-git}
pkgver=r88.71bebbd
pkgrel=1
pkgdesc="carlsmedstad’s custom aurutils scripts"
arch=('any')
url="https://github.com/carlsmedstad/aurutils-extra"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd $_pkgname
	PREFIX="$pkgdir/usr" PROGNM=$pkgname make install
}
