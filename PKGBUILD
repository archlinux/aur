# Maintainer: cyber-luna <cyber-luna@tuta.io>

pkgname='lunas'
pkgver=1.4.2
pkgrel=1
pkgdesc="A syncing cli tool that can handle more than two directories locally and remotely"
arch=('any')
url="https://codeberg.org/cyber-luna/lunas"
license=('GPL3')
depends=('libssh')
makedepends=('git' 'gcc' 'make')
source=("git+https://codeberg.org/cyber-luna/lunas")
sha256sums=('SKIP')

build(){
	cd "$srcdir/$pkgname"
	make 
}

package(){
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
