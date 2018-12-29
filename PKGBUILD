# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-primes
_pkgname=Primes
pkgver=0.4.0
pkgrel=2
pkgdesc='Prime numbers in Julia'
arch=(any)
url=https://github.com/JuliaMath/Primes.jl
license=(MIT)
depends=(julia julia-compat julia-datastructures julia-orderedcollections)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaMath/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('489f5c77fc2fceb00b2d8c2571b1e85808322c8e762a5d1712e8bfbfb3c8bc36')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
