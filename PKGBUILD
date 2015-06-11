# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=rc.local.d
pkgver=1396841433
pkgrel=1
pkgdesc="Startup-system independent startup scripts"
url="https://github.com/GNU-Pony/rc.local.d"
arch=(any)
license=(GPL3)
depends=(bash)
optdepends=(linux findutils kbd ntp alsa-utils)
makedepends=(make coreutils general-preprocessor)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(a74d39dd6e6825509112f9796e87b138ad1a810e6dd578bbacec1c47891e171e)


build() {
	cd "${srcdir}/rc.local.d-${pkgver}"
	make PKGNAME="${pkgname}"
}

package() {
	cd "${srcdir}/rc.local.d-${pkgver}"
	make PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

