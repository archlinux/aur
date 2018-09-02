# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.11.1
pkgrel=1
pkgdesc='Julia implementation of Data structures'
arch=(any)
url=https://github.com/JuliaCollections/DataStructures.jl
license=(custom)
depends=(julia julia-compat) # julia-primes) circular dependency for check()

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaCollections/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('7c996c7737afeb91adb25813da9ade060c547cb4bded30aace3206091fb26725')

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
