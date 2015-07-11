# Contributor: Alan Brault <extrarius.aur@incruentatus.net>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=yum-utils
pkgver=1.1.31
pkgrel=3
pkgdesc="A collection of utilities and plugins extending and supplementing yum in different ways"
arch=('any')
license=('GPLv2')
url="http://yum.baseurl.org/wiki/YumUtils"
depends=('yum')
makedepends=('intltool')
source=("http://yum.baseurl.org/download/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b2859b89321b98f2581243536e1b4993')

prepare() {
	cd "$pkgname-$pkgver"
	find -type f | xargs sed -i 's|#! */usr/bin/python|&2|'
	sed -e 's|/usr/sbin/|/usr/bin/|g' -i Makefile
}

package() {
	cd "$pkgname-$pkgver"
	make PYTHON=python2 DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
