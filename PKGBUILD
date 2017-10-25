# Maintainer: Valeriy Huz <ghotrix@gmail.com>
pkgname=syzygytb-git # '-bzr', '-git', '-hg' or '-svn'
_pkgname=syzygytb
pkgver=r2.e7ea7b0
pkgrel=1
pkgdesc="5 man Syzygy tablebase."
arch=('any')
url=""
license=('GPL2' 'GPL')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('stockfish')
source=("${_pkgname}::git+https://bitbucket.org/ghotrix/syzygy5.git")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${srcdir}/${_pkgname}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	mkdir -p "${pkgdir}/opt/${_pkgname}"
	cp "$srcdir/${_pkgname}"/* "${pkgdir}/opt/${_pkgname}"
}
