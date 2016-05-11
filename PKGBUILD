# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=tab
pkgver=4.0
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="http://tkatchev.bitbucket.org/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('bf660c48a8fcabc8b5ecfa4c34c9e4fdd20611413b098a63c63b2a4538371a38')

_dirname="tkatchev-tab-94c0265aaa8d"

build() {
	cd "$_dirname"
	make
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
