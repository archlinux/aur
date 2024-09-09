# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Brodi <me@brodi.space>

pkgname=aretext
pkgver=1.3.0
pkgrel=2
pkgdesc="Minimalist text editor with vim-compatible key bindings"
arch=(x86_64)
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("go")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('778dda2d2227145deff1c43efa667fe16e2c19e4fb2b656a11dfe6a99ebcf838')

build() {
	cd ${pkgname}-${pkgver}
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		.
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
