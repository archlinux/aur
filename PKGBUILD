# Maintainer: cyber-luna <cyber-luna@tuta.io>

pkgname='lunawp'
pkgver=0.1.2
pkgrel=1
pkgdesc="a tool that changes your wallpaper if your workspace changes"
arch=('any')
url="https://github.com/nodeluna/lunawp"
license=('GPL3')
depends=('swww')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/nodeluna/lunawp")
sha256sums=('SKIP')

build(){
	cd "$srcdir/$pkgname"
	make -j4
}

package(){
	cd "$srcdir/$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 man/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
