# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=tab
pkgver=4.1
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="http://tkatchev.bitbucket.org/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('a24e364544c71008f03b4ddb6c72163c219099e88ab6429fdeeb4929977cca52')

_dirname="tkatchev-tab-8d6175e2fa83"

build() {
	cd "$_dirname"
	make
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
