# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=usockets
pkgname=usockets
pkgver=0.6.0
epoch=1
pkgrel=1
pkgdesc="Miniscule cross-platform eventing, networking & crypto for async applications"
url="https://github.com/uNetworking/uSockets"
license=('Apache')
arch=('any')
_commit='7683672d87067cd75b854f4e36b9820f4809a4be'
source=( "https://github.com/uNetworking/uSockets/archive/${_commit}.tar.gz" )
md5sums=('4b98fcca9965e73ba749ea3404e5614e')
depends=( openssl )

prepare() {
	cd "uSockets-$_commit"
	patch < ../../usockets-0.6.0-Makefile.patch		
}

build() {
	cd "uSockets-$_commit"
	make VERSION=$pkgver WITH_OPENSSL=1 default
}

package() {
	cd "uSockets-$_commit"
	make VERSION=$pkgver DESTDIR="$pkgdir/" install
}

#vim: syntax=sh
