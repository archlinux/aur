# Maintainer: CobbCoding 
pkgname=cano-git
_pkgname=cano
pkgver=r93.8efde9f
pkgrel=1
pkgdesc="Terminal-based modal text editor"
arch=('x86_64')
url="https://github.com/CobbCoding1/cano"
license=('APACHE')
depends=('ncurses' 'glibc')
makedepends=('git' 'make' 'gcc')
source=("$_pkgname::git+https://github.com/CobbCoding1/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname" 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname" 
	make -B
}

package() {
    cd "$_pkgname" 
    install -Dm755 ./build/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 ./README.md "$pkgdir/usr/share/doc/$_pkgname"
}
