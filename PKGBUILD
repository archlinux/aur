# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.14.0
pkgrel=1
pkgdesc='Julia implementation of Data structures'
arch=(any)
url=https://github.com/JuliaCollections/DataStructures.jl
license=(custom)
depends=(julia julia-compat) # julia-primes) circular dependency for check()

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaCollections/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('7934fd1fd78e9489cbafd73ee1a07381953035e675b3d5c6a7faa6cde1e4f087')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/

	install -Dm644 License.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Has circular dependency on julia-primes
#check() {
#	cd $_pkgname.jl-$pkgver
#	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
