# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=obs-service-tar_scm
_pkgver=0.5.3
pkgver=${_pkgver}.r213
pkgrel=1
pkgdesc="Source Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-tar_scm"
license=('GPL3')
source=("${pkgname}::git+https://github.com/openSUSE/${pkgname}.git")
groups=('obs')
depends=('python2' 'obs-build' 'git')
optdepends=('subversion: svn repo support.'
			'mercurial: hg repo support.'
			'bzr: bzr repo support.')
install=${pkgname}.install
backup=("etc/obs/services/tar_scm")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.r%s" "${_pkgver}" "$(git rev-list --count HEAD)"
}	

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} PREFIX=/usr install 
}
