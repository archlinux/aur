# Maintainer: someStranger8 <someStranger87@gmail.com>
pkgname=('freakyfetch')
pkgver=r34.f64409f
pkgrel=1
pkgdesc="Finally, a fetch that can match my freak!"
arch=('x86_64')
url="https://github.com/icosa-dev/freakyfetch"
license=('GPL')
depends=('viu')
makedepends=('git' 'make' 'gcc') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
options=()
install=
source=('git+https://github.com/icosa-dev/freakyfetch.git')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	make
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	sudo make install
}
