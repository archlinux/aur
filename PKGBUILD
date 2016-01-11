# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=obs-service-set_version
_pkgver=0.5.3
pkgver=${_pkgver}.r77
pkgrel=1
pkgdesc="Version Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/${pkgname}"
license=('GPL3')
source=("${pkgname}::git+https://github.com/openSUSE/${pkgname}.git")
groups=('obs')
depends=('obs-build' 'git' 'python2')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.r%s" "${_pkgver}" "$(git rev-list --count HEAD)"
}	

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} PREFIX=/usr install 
}
