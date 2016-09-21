# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=lib50-c
pkgver=7
pkgrel=1
pkgdesc="CS50 / CS50x Library for C (Harvard College's Introduction to Computer Science I)"
arch=('i686' 'x86_64')
url="https://github.com/cs50/library50-c"
license=('BSD')
depends=('glibc')
source=(https://github.com/cs50/${pkgname}/archive/${pkgver}.${pkgrel}.0.tar.gz)
md5sums=('8feb784fcbccf8521b6fe5656bfe3112')
install='lib50-c.install'

build() {
	cd "${srcdir}/${pkgname}-${pkgver}.${pkgrel}.0"
	make build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}.${pkgrel}.0/build"
	install -dm755 "${pkgdir}/"{usr/include,usr/lib,usr/share/man/man3}
	install -Dm644 "usr/lib/libcs50.so" "$pkgdir/usr/lib"
	install -Dm644 "usr/include/cs50.h" "$pkgdir/usr/include"
	install -Dm644 -t "${pkgdir}/usr/share/man/man3" usr/share/man/man3/*
}
