# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bfind
pkgver=2
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://github.com/maandree/bfind"
arch=(any)
license=(GPL3)
depends=(bash coreutils)
makedepends=(make coreutils sed texinfo gzip)
install=bfind.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(54ffd0439d9f9f4579bed39aeaaa72d54f4a270e8961cbc07b67895e96a42cfd)

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

