# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hustmirror-cli # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.2.0.rc
pkgrel=1
pkgdesc="A mirror tool for HUST students"
arch=("x86_64")
url="https://gitee.com/dzm91_hust/hustmirror-cli.git"
license=('GPL')
depends=('python3')
makedepends=('git' 'make') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=('git+https://gitee.com/dzm91_hust/hustmirror-cli.git')
md5sums=('SKIP')
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
    mkdir -p "$srcdir/${pkgname%-git}"
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make test
}

package() {
	cd "$srcdir/${pkgname%-git}"
	sudo cp ./output/hustmirror-cli "/usr/bin/hustmirror-cli"
}
