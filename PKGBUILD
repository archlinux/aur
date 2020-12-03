# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=tab
pkgver=7.2
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="https://tkatchev.bitbucket.io/tab/"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
checkdepends=('python2')
source=("https://bitbucket.org/tkatchev/tab/get/${pkgver}.tar.bz2")
sha256sums=('446703528a7e51601371240a8fb74665aa98b02b2c89034ed61705bb3ff488b4')

_dirname="tkatchev-tab-f2e160ebddf8"

build() {
	cd "$_dirname"
	make
}

check() {
	cd "$_dirname"
	make test
}

package() {
	cd "$_dirname"
	install -Dm755 tab -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/tab/LICENSE"
}
