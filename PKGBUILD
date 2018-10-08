# Maintainer: Cody Schafer <aur at codyps.com>
pkgname=xdpi-git
pkgver=r48.924fcc5
pkgrel=1
pkgdesc="X11 DPI information retrieval"
arch=(x86_64)
url="https://github.com/Oblomov/xdpi"
license=('MPL')
groups=()
depends=('libxinerama' 'xcb-util-xrm' 'libxrandr')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Oblomov/xdpi.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d $pkgdir/usr/bin
	install -D -m755 xdpi $pkgdir/usr/bin/xdpi
}
