# Maintainer: sg3des <sg3des@gmail.com>
# Contributor: sg3des <sg3des@gmail.com>

pkgname=goatee
pkgver=0.9.1
pkgrel=4
pkgdesc='lightwieght gtk2 text/hex editor written on Go'
arch=('i686' 'x86_64')
url='https://github.com/sg3des/goatee'
license=('GPL')
depends=('gtk2' 'gtksourceview2')
makedepends=('git' 'go')
source=("git+https://github.com/sg3des/goatee.git#tag=0.9.1-4")
md5sums=('SKIP')


build() {
	cd $srcdir/$pkgname
	go build -v -o $pkgname -ldflags="-s -w" -trimpath 
}

package() {
	cd $srcdir/$pkgname
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}