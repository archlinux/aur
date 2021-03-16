# Maintainer: Gabriele Musco <gabmus@disroot.org>
pkgname=tz-git
pkgver=20210315.877270d
pkgrel=1
pkgdesc="A time zone helper"
arch=('x86_64' 'i686')
url="https://github.com/oz/tz/"
license=('GPL3')
depends=()
makedepends=('go')
provides=("tz")
conflicts=("tz")
sha1sums=('SKIP')
source=("$pkgname::git+https://github.com/oz/tz/")

pkgver() {
	cd "$pkgname"
	echo "$(git log -1 --format=%cd.%h --date=short|tr -d -)"
}

build() {
	cd "$pkgname"
    go build
}

package() {
	cd "$pkgname"
    install -Dm755 "tz" "$pkgdir/usr/bin/tz"
}
