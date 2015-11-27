# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bfind
pkgver=2.1
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://github.com/maandree/bfind"
arch=(any)
license=(GPL3)
depends=(python3)
makedepends=(make coreutils sed texinfo gzip auto-auto-complete)
install=bfind.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(23e3f4fda397ad235399773f6f357e9a98ed2384881c12015d453192dbc1afc1)

_prefix=/usr


build() {
	cd "${srcdir}/bfind-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/bfind-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	_dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

