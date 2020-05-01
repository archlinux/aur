# Maintainer: Michael Armbruster <michael at armbrust dot me>

pkgname=precomp
_gitname=${pkgname}-cpp
pkgver=0.4.7
pkgrel=1
pkgdesc="Recompressor that further compresses already compressed files"
arch=('x86_64')
url="https://github.com/schnaader/precomp-cpp"
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/schnaader/${_gitname}/archive/v${pkgver}.tar.gz")
md5sums=('6a766bdc8e6b065525cb03dbfb8cb4e0')

build() {
	cd "${_gitname}-${pkgver}"
	make
}

package() {
	cd "${_gitname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 0755 precomp "${pkgdir}/usr/bin"
}
