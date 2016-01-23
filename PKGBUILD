# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=tab
pkgver=2.1
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="http://tkatchev.bitbucket.org/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('42eb412abd5633d710383d9ac205f572463280a13ab4dfddcec945ebda2a7cf6')

_dirname="tkatchev-tab-a47bb9d4ca9d"

build() {
	cd "$_dirname"
	make
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
