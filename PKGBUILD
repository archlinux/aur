# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-orderedcollections
_pkgname=OrderedCollections
pkgver=1.0.2
pkgrel=1
pkgdesc='Julia implementation of associative containers that preserve insertion order '
arch=(any)
url="https://github.com/JuliaCollections/OrderedCollections.jl"
license=(MIT)
depends=(julia)

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('33d4e568f7cbffe9187d7548e86487f375ec0be07fa0da3743a2e008a8453707')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
