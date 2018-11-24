# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-softglobalscope
_pkgname=SoftGlobalScope
pkgver=1.0.7
pkgrel=1
pkgdesc='Utilities for "soft" global scope in interactive Julia environments'
arch=(any)
url=https://github.com/stevengj/SoftGlobalScope.jl
license=(MIT)
depends=(julia julia-compat)

source=(${_pkgname,,}-$pkgver.tar.gz::https://github.com/stevengj/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('ccd762c81c23aa4eb4d008b313884dca08790df168ea68acd75cd45eb967186d')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
