# Maintainer: CobbCoding
pkgname=cano
_pkgname=Cano
# alpha is represented by the last 0 since pkgver cannot contain '-'
pkgver=0.2.0
_pkgver=0.2.0-alpha
pkgrel=1
pkgdesc="Terminal-based modal text editor"
arch=('x86_64')
url="https://github.com/CobbCoding1/cano"
license=('APACHE')
depends=('glibc' 'ncurses')
makedepends=('make' 'gcc')
conflicts=('cano-git')
source=("$pkgname-$pkgver::https://github.com/CobbCoding1/Cano/archive/refs/tags/v$_pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$_pkgname-$_pkgver"
    make -B
}

package() {
	cd "$_pkgname-$_pkgver"
	make install
    install -Dm755 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
