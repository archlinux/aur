# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=Soundpipe
pkgname=soundpipe-git
pkgver=v1.5.0.r0.g3e0c985
pkgrel=1
pkgdesc="A lightweight music DSP library."
arch=(any)
url="http://paulbatchelor.github.io/proj/soundpipe.html"
license=(MIT)
makedepends=(git libsndfile)
provides=(soundpipe)
conflicts=(soundpipe)
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	PREFIX="${pkgdir}/usr" make install -e
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

