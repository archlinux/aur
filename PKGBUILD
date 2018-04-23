# Maintainer: doragasu: doragasu <yawn> hotmail <roll> com

_basename=protobuf-c-rpc
pkgname=${_basename}-git
pkgver=292.07fed6d
pkgver() {
	cd ${_basename} || exit
	echo "$(git rev-list --count master).$(git rev-parse --short master)"
}
pkgrel=2
pkgdesc="This is protobuf-c-rpc, a library for performing RPC with protobuf-c."
arch=('i686' 'x86_64')
url="https://github.com/protobuf-c/${_basename}"
license=('BSD')
depends=('protobuf-c')

source=("git+https://github.com/protobuf-c/${_basename}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_basename}"
	./autogen.sh && \
	./configure --prefix=/usr && \
	make
}

package() {
	cd "${srcdir}/${_basename}"
	DESTDIR=${pkgdir} make install
}

