# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=ldetect
pkgdesc="Tools to redirect stdin on different commands according to detected language"
url="https://git.sr.ht/~primalmotion/ldetect"
pkgver=v1.1.0
pkgrel=1
license=(GPL3)
arch=(any)
makedepends=(go)
source=("https://git.sr.ht/~primalmotion/ldetect/archive/${pkgver}.tar.gz")
sha256sums=('ac51916499008f5f889a393214790b67c073b78f2bbd610e67b2568fce874f07')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -trimpath
}

package() {
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/ldetect ${pkgdir}/usr/bin/ldetect
}
