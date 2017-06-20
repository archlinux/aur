# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=tab
pkgver=6.2.2
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="http://tkatchev.bitbucket.org/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('19edd1183ee0e3bb9d79e022141567779ef42d9ebddbfd09317aaf5bc700be8d')

_dirname="tkatchev-tab-efe6f906ae05"

build() {
	cd "$_dirname"
	make
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
