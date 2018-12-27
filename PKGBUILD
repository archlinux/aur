# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-softglobalscope
_pkgname=SoftGlobalScope
pkgver=1.0.8
pkgrel=1
pkgdesc='Utilities for "soft" global scope in interactive Julia environments'
arch=(any)
url=https://github.com/stevengj/SoftGlobalScope.jl
license=(MIT)
depends=(julia julia-compat)

source=(${_pkgname,,}-$pkgver.tar.gz::https://github.com/stevengj/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('6ae2150fb04756cc1b353bcfd03135e20f2d0511cb9178a9398a39ef8c6d3f47')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
