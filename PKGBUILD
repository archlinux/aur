# Maintainer: Michael Armbruster <michael at armbrust dot me>

pkgname=precomp
_gitname=${pkgname}-cpp
pkgver=0.4.7
pkgrel=2
pkgdesc="Recompressor that further compresses already compressed files"
arch=('x86_64')
url="https://github.com/schnaader/precomp-cpp"
license=('Apache')
depends=('gcc-libs')
source=("https://github.com/schnaader/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('b4064f9a18b9885e574c274f93d73d8a4e7f2bbd9e959beaa773f2e61292fb2b')

build() {
	cd "${_gitname}-${pkgver}"
	make
}

package() {
	cd "${_gitname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 0755 precomp "${pkgdir}/usr/bin"
}
