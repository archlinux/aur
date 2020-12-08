# Maintainer: Josh Wright <wright.jjw@gmail.com>
pkgname=st-wrightjjw-git
pkgver=0.8.4
pkgrel=1
pkgdesc="Josh's build of suckless st"
arch=('x86_64')
url="https://github.com/wrightjjw/st"
license=('MIT')
depends=(libxft ttf-cascadia-code)
provides=(st)
conflicts=(st)
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd st
	printf "0.8.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd st
	make
}

package() {
	cd st
	make PREFIX="$pkgdir/usr" install
}
