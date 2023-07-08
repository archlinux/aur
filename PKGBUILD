# Maintainer: Federico Carbone <federico.carbone20@gmail,com>
#
pkgname='jsondbc-git'
pkgver=v0.3.3.r0.31402f6
pkgrel=1
pkgdesc="A tool to convert CAN models definded in JSON"
arch=('any')
url="https://github.com/squadracorsepolito/jsondbc"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname"
	go build
}

package() {
	cd "$srcdir/$pkgname"
	GOBIN="$pkgdir/usr/bin" go install
}
