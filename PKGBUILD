# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=ldetect
pkgdesc="Tools to redirect stdin on different commands according to detected language"
url="https://git.sr.ht/~primalmotion/ldetect"
pkgver=v1.0.0
pkgrel=1
license=(GPL3)
arch=(any)
makedepends=(go)
source=("https://git.sr.ht/~primalmotion/ldetect/archive/${pkgver}.tar.gz")
sha256sums=('490a73263f8048d95234e7917817d379ad7acc4ae4cb5e839012d7bb440bb5f4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	go build -trimpath
}

package() {
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/ldetect ${pkgdir}/usr/bin/ldetect
}
