# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-offsetarrays
_pkgname=OffsetArrays
pkgver=0.8.1
pkgrel=1
pkgdesc='Provides Julia users with arrays that have arbitrary indices'
arch=(any)
url=https://github.com/JuliaArrays/OffsetArrays.jl
license=(MIT)
depends=(julia julia-compat)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaArrays/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('837a56dad27d8e67073f89fede4bd213b8202c2aab509a5ee6d49862a3aea4c6')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
