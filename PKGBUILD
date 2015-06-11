# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pytagomacs
pkgver=1417073566
pkgrel=1
pkgdesc="An Emacs like key–value editor library for Python"
url="https://github.com/GNU-Pony/pytagomacs"
arch=(any)
license=(GPL3)
depends=(python3 coreutils)
makedepends=(make coreutils python3)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(3b492aed48e0ea5d0d42c8b2189a2db9472d54e68e050be527a30f91e49516d2)


build() {
	cd "${srcdir}/pytagomacs-${pkgver}"
	make PREFIX=/usr PY_MAJOR=3 PY_MINOR=4
}

package() {
	cd "${srcdir}/pytagomacs-${pkgver}"
	make PREFIX=/usr PY_MAJOR=3 PY_MINOR=4 DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

