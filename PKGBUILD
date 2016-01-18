# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=tab
pkgver=2.0
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i386' 'x86_64')
url="http://tkatchev.bitbucket.org/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('30adb1d8ac5b57dcba92293382864dd35322d69d2cde376c3efc00e30932fdac')

_dirname="tkatchev-tab-ff6c5c55525d"

build() {
	cd "$_dirname"
	make
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
