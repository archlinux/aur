# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>

pkgname=gamescope-session-sk-git
_gitdir=gamescope-session
pkgver=r223.0dbb596
pkgrel=1
pkgdesc="Common gamescope session files"
arch=('any')
url="https://github.com/ChimeraOS/gamescope-session"
license=('MIT')
groups=()
depends=('gamescope')
makedepends=('git')
install=gamescope-session.install
source=("${_gitdir}::git+https://github.com/3003n/${_gitdir}.git#branch=dev")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
	cp -rv ${srcdir}/${_gitdir}/usr ${pkgdir}/usr
	install -Dm644 ${srcdir}/${_gitdir}/LICENSE ${pkgdir}/usr/share/licenses/${_gitdir}/LICENSE
}
