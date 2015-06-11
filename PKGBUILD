# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=featherweight
pkgver=1428444876
pkgrel=1
pkgdesc="A lightweight news syndication aggregator for your terminal shell"
url="https://github.com/GNU-Pony/featherweight"
arch=(any)
license=(GPL3)
depends=(python3 coreutils wget pytagomacs html2text)
makedepends=(make coreutils python3 zip texinfo)
install=featherweight.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(17e8031bec3a68171acc182d925a684b53a2f28c9275362b5592510c07fe2c3b)


build() {
	cd "${srcdir}/featherweight-${pkgver}"
	make PREFIX=/usr PY_MAJOR=3 PY_MINOR=4
}

package() {
	cd "${srcdir}/featherweight-${pkgver}"
	make PREFIX=/usr PY_MAJOR=3 PY_MINOR=4 DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

