# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-compat
_pkgname=Compat
pkgver=1.4.0
pkgrel=1
pkgdesc='Compat Package for Julia.'
arch=(any)
url=https://github.com/JuliaLang/Compat.jl
license=(MIT)
depends=(julia)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('64913d7dbde5b5a64608a1a52dc127dd58c9089dfa68fa4d3584a0a38ac50e5e')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
