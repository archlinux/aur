# Maintainer: TurtleRuss <tttturtleruss@gmail.com>
pkgname=hustmirror-cli # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.2.0.rc
pkgrel=1
pkgdesc="The command line tool (hustmirror-cli) is a small tool that can help you quickly change sources to HUST mirror sources."
arch=("x86_64")
url="https://gitee.com/hustmirror/hustmirror-cli.git"
license=('GPL')
depends=('python3')
makedepends=('git' 'make') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=('git+https://gitee.com/hustmirror/hustmirror-cli.git')
md5sums=('SKIP')

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
