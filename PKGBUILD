# Maintainer: Gauge Krahe <gauge.krahe at gmail dot com>

name=fet.sh
pkgname=$name-git
pkgver=1.2.r1.gd336d54
pkgrel=1
pkgdesc="A simple fetch written in POSIX shell without any external commands"
arch=(any)
url="https://github.com/6gk/$name"
license=('ISC')
makedepends=('git')
provides=("$name")

source=("$pkgname::git+https://github.com/6gk/$name")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$name" "$pkgdir/usr/bin/$name"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
