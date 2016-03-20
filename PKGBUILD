pkgname=git-remote-bzr
pkgver=v0.2.r14.gea3eb41
pkgrel=1
pkgdesc=" Transparent bidirectional bridge between Git and Bazaar for Git "
arch=('i686' 'x86_64')
url="https://github.com/felipec/git-remote-bzr"
license=('GPL2')
depends=('bzr' 'git')
makedepends=('asciidoc')
source=('git+https://github.com/felipec/git-remote-bzr.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags   | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
