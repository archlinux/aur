# Maintainer: Lukas Burgey <mail@lukasburgey.de>

basepkgname=kerl
pkgname="${basepkgname}-git"
pkgver=2.2.2.r0.077d16d
pkgrel=1
pkgdesc="Easy building and installing of Erlang/OTP instances"
url="https://github.com/kerl/kerl"
arch=(i686 x86_64)
license=('MIT')
provides=($basepkgname)
conflicts=($basepkgname)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$basepkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$basepkgname"
	install -Dm755 kerl "$pkgdir/usr/bin/kerl"
}
