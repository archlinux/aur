# Maintainer: Dustin Falgout <dustin@antergos.com>
# Maintainer: Giovanni Santini <itachi.sama.amaterasu@gmail.com>

pkgname=obs-service-tar_scm-git
_pkgver=0.6.0
pkgver=0.6.0.r312
pkgrel=1
pkgdesc="Source Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-tar_scm"
license=('GPL3')
source=("${pkgname}::git+https://github.com/openSUSE/${pkgname%-git}.git")
groups=('obs')
depends=('python2' 'obs-build' 'git')
optdepends=('subversion: svn repo support.'
			'mercurial: hg repo support.'
			'bzr: bzr repo support.')
backup=("etc/obs/services/tar_scm")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.r%s" "${_pkgver}" "$(git rev-list --count HEAD)"
}	

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install 
}
