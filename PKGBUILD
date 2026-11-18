
pkgname=0rwx-icons-git
_pkgname="${pkgname%-git}"
pkgver=r50.12085dc
pkgrel=1
pkgdesc="A simplified model of AI usage categories, inspired by unix permissions."
arch=('any')
url="https://0rwx.com/"
license=('CC0-1.0')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://github.com/NamtaoProductions/0rwx.com.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -vdm644 "${pkgdir}/usr/share/${_pkgname}"
	cp -v "${srcdir}/${_pkgname}/static/AI-"{0,R,W,X}-{dark,light}.{png,svg} "${pkgdir}/usr/share/${_pkgname}"
}
