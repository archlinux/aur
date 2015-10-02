# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pytagomacs
pkgver=1443787175
pkgrel=1
pkgdesc="An Emacs like key–value editor library for Python"
url="https://github.com/GNU-Pony/pytagomacs"
arch=(any)
license=(GPL3)
depends=(python3 coreutils)
makedepends=(make coreutils python3)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(e259f77bd3a34acfbe2d8327cf9655d31a511a2521caaf9c63f3f1e35bb981ac)


build() {
	cd "${srcdir}/pytagomacs-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/pytagomacs-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

