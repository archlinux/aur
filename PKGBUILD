# Maintainer: Akrai <drokergeek@gmail.com>

pkgname=systemd-guest-user
pkgver=18.54e327a
pkgrel=1
url='https://github.com/Akrai/systemd-guest-user'
pkgdesc='A simple systemd configurations for guest user support'
arch=(any)
license=(GPL3)
depends=(systemd)
#source=("${pkgname}::git://github.com/a-m-s/$pkgname") commenting this line in favor of using https as asked by an user
source=("${pkgname}::git+https://github.com/Akrai/$pkgname")
md5sums=(SKIP)

function pkgver() {

	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

function package() {

	cd "$pkgname"
	install -vd "$pkgdir/usr/lib" "$pkgdir/usr/share/licenses/$pkgname"
	cp -vr */ "$pkgdir/usr/lib"
	cp -v LICENSE.md "$pkgdir/usr/share/licenses/$pkgname"
}
