# Maintainer: Gauge Krahe <gauge.krahe at gmail dot com>

_name=scr
pkgname=$_name-git
pkgver=2.1.r1.gd2dfe92
pkgrel=1
pkgdesc="A ffmpeg recording script"
arch=(any)
url="https://github.com/6gk/$pkgname"
license=('ISC')
makedepends=('git')
depends=('ffmpeg' 'procps-ng' 'slop')
optdepends=('mmutils-git' 'xclip' 'wmutils-git' 'dmenu' 'rofi')
provides=("$_name")

source=("$pkgname::git+https://github.com/6gk/$_name")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
	cd "$srcdir/$pkgname"
	install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
