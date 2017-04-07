# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=Soundpipe
pkgname=soundpipe
pkgver=1.5.0
pkgrel=1
pkgdesc="A lightweight music DSP library."
arch=(any)
url="http://paulbatchelor.github.io/proj/soundpipe.html"
license=(MIT)
makedepends=(libsndfile)
source=("https://github.com/PaulBatchelor/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('e9bd3c1f2b47f05a76cc89e47f2f68b1')

build() {
	cd "${_pkgname}-${pkgver}"
	make
}

package() {
	cd "${_pkgname}-${pkgver}"
	PREFIX="${pkgdir}/usr" make install -e
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
