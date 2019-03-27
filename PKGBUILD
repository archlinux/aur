# Maintainer:
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.0
pkgrel=3
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL")
depends=("gmime" "xapian-core" "guile2.0")
makedepends=("emacs")
optdepends=("guile: guile support"
	"emacs: mu4e support")
source=("https://github.com/djcb/mu/archive/v$pkgver.tar.gz")
md5sums=('b415f84d4538cf05ec3360a449c1de4d')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr --disable-webkit --disable-gtk --enable-mu4e --enable-guile
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
