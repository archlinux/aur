# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=kmonad-git
pkgver=0.4.0.r37.9a2a8a8
pkgrel=1
pkgdesc="An advanced keyboard manager"
arch=('any')
url=""
license=('MIT')
groups=()
depends=()
makedepends=('git' 'stack') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/david-janssen/kmonad")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	stack build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	stack install --local-bin-path="$pkgdir/usr/bin"
}
