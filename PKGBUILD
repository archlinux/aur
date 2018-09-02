# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-softglobalscope
_pkgname=SoftGlobalScope
pkgver=1.0.2
pkgrel=1
pkgdesc='Utilities for "soft" global scope in interactive Julia environments'
arch=(any)
url=https://github.com/stevengj/SoftGlobalScope.jl
license=(MIT)
depends=(julia julia-compat)

source=(${_pkgname,,}-$pkgver.tar.gz::https://github.com/stevengj/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('d9cd23262a9952917c7378cf0dac1124f505b4faaebb304a9cfb895c74e74c60')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
