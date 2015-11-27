# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=bfind
pkgver=2.1.1
pkgrel=1
pkgdesc="find alternative optimised for finding files rather then listing files"
url="https://github.com/maandree/bfind"
arch=(any)
license=(GPL3)
depends=(python3)
makedepends=(make coreutils sed texinfo gzip auto-auto-complete)
install=bfind.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(398981af6b5e178761bed29390a32a1cc8866f09c7771b0a3483ee08a457f61c)

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

