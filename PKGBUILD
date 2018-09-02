# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-json
_pkgname=JSON
pkgver=0.19.0
pkgrel=1
pkgdesc='JSON parsing and printing for Julia'
arch=(any)
url=https://github.com/JuliaIO/JSON.jl
license=(MIT)
depends=(julia
  julia-compat
  julia-datastructures
  julia-fixedpointnumbers
  julia-offsetarrays
)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaIO/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('b5e4445c0211cebf114c24b3d941f57948f453e2689fc3a6d7673f2cc70b3ce4')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
