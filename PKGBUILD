# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=tab
pkgver=6.0
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="http://tkatchev.bitbucket.org/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('e5b054c307d4b0ad2c026616e979af212ee1145d430a2422f98bcea74283cce9')

_dirname="tkatchev-tab-19b5a0ea71ae"

build() {
	cd "$_dirname"
	make
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
