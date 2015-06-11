# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=applebloom
pkgver=1396811847
pkgrel=1
pkgdesc="Apple Bloom the pony dictionary"
url="https://github.com/GNU-Pony/applebloom"
arch=(any)
license=(AGPL3)
depends=(bash coreutils)
makedepends=(make coreutils sed texinfo gzip)
install=applebloom.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(899e6cc9ccdb3143158e43b8f0bedcb3babdb89533ad575eb72e339f183cc7bc)

_prefix=/usr


build() {
	cd "${srcdir}/applebloom-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DESTDIR="${pkgdir}" default
}

package() {
	cd "${srcdir}/applebloom-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	_dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/AGPL3" "${_dir}/LICENSE"
}

