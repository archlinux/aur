# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-versionparsing
_pkgname=VersionParsing
pkgver=1.1.2
pkgrel=1
pkgdesc="Flexible parsing of version-number strings into Julia's built-in VersionNumber type"
arch=(any)
url=https://github.com/stevengj/VersionParsing.jl
license=(MIT)
depends=(julia julia-compat)

source=($pkgname-$pkgver.tar.gz::https://github.com/stevengj/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('118c64779a57dce18afaf5d0d0a1214c082381d0a8e0d205073144134f1373fd')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 "$pkgdir"/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} "$pkgdir"/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
