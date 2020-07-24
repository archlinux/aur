# Maintainer: Wojciech Kepka <wojtek.kepka@protonmail.com>
pkgname=gomd-git
pkgver=1.3.3.694d191
pkgrel=1
epoch=
pkgdesc="Quick webserver displaying formatted markdown files"
arch=('x86_64' 'i686')
url="https://github.com/wojciechkepka/gomd"
license=('MIT')
depends=()
makedepends=('sassc' 'nodejs-clean-css-cli' 'uglify-js' 'make' 'go')
provides=("gomd")
conflicts=("gomd")
sha1sums=('SKIP')
source=("$pkgname::git+https://github.com/wojciechkepka/gomd")

build() {
	cd "$pkgname"
    make
}

pkgver() {
	cd "$pkgname"
	echo "$(git log -1 --format=%cd.%h --date=short|tr -d -)"
}

package() {
	cd "$pkgname"
    install -Dm755 "build/gomd" "$pkgdir/usr/bin/gomd"
}
