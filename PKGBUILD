# Maintainer: lanthora <lanthora at outlook dot com>
# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=uwebsockets
pkgname=uwebsockets
pkgver=20.37.0
pkgrel=2
pkgdesc="Simple, secure & standards compliant web server for the most demanding of applications"
url="https://github.com/uNetworking/uWebSockets"
license=('Apache')
arch=('x86_64')
source=( "$pkgname-$pkgver.tar.gz::https://github.com/uNetworking/uWebSockets/archive/v$pkgver.tar.gz" )
md5sums=('1fdad53ba3bfea8d9b2bd460d92e6292')
depends=( usockets )

package() {
	cd "uWebSockets-$pkgver"
	patch < ../../uwebsockets-$pkgver-Makefile.patch
	mkdir -p "$pkgdir"/usr/include/uWebSockets
	cp -a src/. "$pkgdir"/usr/include/uWebSockets
	mkdir -p "$pkgdir"/usr/lib/pkgconfig
	cp uwebsockets.pc "$pkgdir"/usr/lib/pkgconfig/uwebsockets.pc
}

#vim: syntax=sh
