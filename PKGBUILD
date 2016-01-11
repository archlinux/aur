# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=obs-service-recompress
_pkgver=0.3.1
pkgver=${_pkgver}.r14
pkgrel=1
pkgdesc="Compression Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-recompress"
license=('GPL3')
source=("${pkgname}::git+https://github.com/openSUSE/${pkgname}.git")
groups=('obs')
depends=('obs-build' 'git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.r%s" "${_pkgver}" "$(git rev-list --count HEAD)"
}	

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} PREFIX=/usr install 
}
