# Maintainer: Andrew Gregory Neumann <agneum14@gmail.com>
pkgname=wmarchup-git
pkgver=1
pkgrel=1
pkgdesc="Window Maker dockapp which monitors for package updates"
arch=('x86_64')
url="https://github.com/agneum14/wmArchUp"
license=('custom')
depends=('libdockapp' 'libx11')
makedepends=('git')
optdepends=('windowmaker')
source=($pkgname::git+$url)
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -Dm644 ./COPYING $pkgdir/usr/share/licenses/$pkgdir/COPYING
	install -Dm644 ./README $pkgdir/usr/share/docs/$pkgdir/README
	install -Dm644 ./AUTHORS $pkgdir/usr/share/docs/$pkgdir/AUTHORS
	install -Dm644 ./CHANGES $pkgdir/usr/share/docs/$pkgdir/CHANGES
}
