# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
_pkgname=ti
pkgname=ti-git
pkgver=r137.39cfe91
pkgrel=1
pkgdesc="A simple command line time tracker"
arch=('any')
url="http://ti.sharats.me/"
license=('MIT')
groups=()
depends=('python-yaml' 'python-colorama')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+https://github.com/sharat87/ti")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%}"
	mkdir -p $pkgdir/usr/local/bin
    install -m 755 bin/ti $pkgdir/usr/local/bin
}
