# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-fixedpointnumbers
_pkgname=FixedPointNumbers
pkgver=0.5.3
pkgrel=1
pkgdesc='Fixed point types for Julia'
arch=(any)
url=https://github.com/JuliaMath/FixedPointNumbers.jl
license=(MIT)
depends=(julia julia-compat)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaMath/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('b24651e1f4e87cb1fae625cef50caabfff36dcf5b448a8c0d803eb6c06faa39d')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
