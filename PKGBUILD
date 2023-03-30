# Maintainer: lanthora <lanthora at outlook dot com>
# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=usockets
pkgname=usockets
pkgver=0.8.5
pkgrel=2
pkgdesc="Miniscule cross-platform eventing, networking & crypto for async applications"
url="https://github.com/uNetworking/uSockets"
license=('Apache')
arch=('x86_64')
source=( "https://github.com/uNetworking/uSockets/archive/refs/tags/v${pkgver}.tar.gz" )
md5sums=('e07e6a53cba781455fcf3cf71e9760c3')
depends=( openssl )

prepare() {
	cd "uSockets-$pkgver"
	patch < ../../usockets-$pkgver-Makefile.patch		
}

build() {
	cd "uSockets-$pkgver"
	make VERSION=$pkgver WITH_OPENSSL=1 default
}

package() {
	cd "uSockets-$pkgver"
	make VERSION=$pkgver DESTDIR="$pkgdir/" install
}

#vim: syntax=sh
