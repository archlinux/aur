# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=systemd-guest-user
pkgver=6.591c4d9
pkgrel=1
url='https://github.com/kalterfive/systemd-guest-user'
pkgdesc='A simple implementation of guest user'
arch=(any)
license=(GPL3)
depends=(systemd)
source=("${pkgname}::git://github.com/kalterfive/$pkgname")
md5sums=(SKIP)

function pkgver() {

	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

function package() {

	cd "$pkgname"
	install -vd "$pkgdir/usr/lib"
	cp -vr * "$pkgdir/usr/lib"
}
