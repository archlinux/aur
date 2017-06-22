# Maintainer: Loic Blot <loic.blot@unix-experience.fr>
pkgname=libluasandbox
pkgver=1.2.5
pkgrel=1
pkgdesc="Generic Lua sandbox for dynamic data analysis"
source=("https://github.com/mozilla-services/lua_sandbox/archive/v$pkgver.tar.gz")
sha256sums=('9a63b37f1b9b6d40afa45f92e3777f3baf770d195cb41fad04a0e020d398ebed')
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('cmake')

_buildroot="release"
build() {
	cd lua_sandbox-$pkgver
	mkdir $_buildroot
	cd $_buildroot
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make
}

package() {
	cd lua_sandbox-${pkgver}/${_buildroot}
	make install
}
