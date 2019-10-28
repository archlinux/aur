# Maintainer: Matthijs Tadema <M dot J dot Tadema at protonmail dot com>
pkgname=python-pytris-git
pkgver=r41.eb2f855
pkgrel=1
pkgdesc="A cli tetris game written in python using curses"
arch=('any')
url="https://github.com/mjtadema/pytris/tree/v0.1"
license=('MIT')
groups=()
depends=('python>=3.7' 'python-numpy')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/mjtadema/pytris.git#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	/usr/bin/env python3 setup.py install --prefix=/usr --root="$pkgdir"
}
