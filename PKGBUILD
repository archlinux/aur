# Maintainer: shafilalam <alamshafil@pm.me>

_name=libdogecoin
pkgname=libdogecoin-git
pkgver=0.1.0
pkgrel=1
pkgdesc="libdogecoin is a c library to enable the direct integration of dogecoin into many different platforms in a lightweight manner, without developers having to procure deep blockchain experience."
arch=('x86_64' 'i686')
url="https://github.com/dogecoinfoundation/libdogecoin/"
license=('MIT')
provides=('libdogecoin' 'libdogecoin.so')
depends=('libevent')
makedepends=('gcc' 'make' 'git')
source=("git+https://github.com/dogecoinfoundation/libdogecoin.git")
sha256sums=('SKIP')

build() {
	cd ${_name}

	./autogen.sh

	./configure --prefix=/usr

	make
}

package() {
	cd ${_name}
	make DESTDIR=${pkgdir} install 
}

