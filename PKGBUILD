# Maintainer: Joel Grunbaum <joel@joelg.net>
_pkgname=dnscomp
pkgname=$_pkgname-git
pkgver=0.r26.7a2cec3
pkgrel=1
pkgdesc="A simple, fast DNS benchmark tool"
arch=('x86_64')
license=('MIT')
makedepends=('git')
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/Chizi123/dnscomp.git")
url="https://github.com/Chizi123/dnscomp.git"
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	CFLAGS="-O2 -lpthread" make
}

package() {
	cd "$_pkgname"
	install -Dm755 dnscomp "$pkgdir/usr/bin/dnscomp"
}
