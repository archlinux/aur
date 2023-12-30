# Maintainer: Michael Schönitzer <michael@schoenitzer.de>
pkgname=getrid-git
pkgver=0.2.2
pkgrel=3
pkgdesc="Terminal user interface to decide which packages to keep and which to get rid of"
arch=('any')
url="https://github.com/Nudin/getrid"
license=('GPL')
depends=('python' 'python-urwid' 'pacgraph')
source=("$pkgname::git+https://github.com/Nudin/getrid.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
