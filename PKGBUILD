# Maintainer: Burak <burakberkkeskin@gmail.com>
pkgname=fuel-git
pkgver=2.0.0.r0.2602df1
pkgrel=1
pkgdesc="With this CLI Tool, Fuel Price list information is instantly retrieved by city group. Price List information is printed on the screen by Parse instantly from Petrolofisi.com.tr"
arch=(x86_64)
url="https://github.com/safderun/fuel"
license=('GPL')
makedepends=(go git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname%-git}"
  go build .
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
