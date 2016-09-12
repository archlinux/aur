# Maintainer: HabarNam <habarnam@gmail.com>
pkgname=orion-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r205.3339da5
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'x86')
url="https://github.com/alamminsalo/orion"
license=('GPL')
groups=()
depends=('libcommuni-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/alamminsalo/orion.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir "build" && cd "./build"
	qmake ../
	make
}

package() {
	cp -r "$srcdir/${pkgname%-git}" "$pkgdir" 
}
