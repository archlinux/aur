# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=tab
pkgver=9.2
pkgrel=1
pkgdesc="A general-purpose query language for text files."
arch=('i686' 'x86_64')
url="https://tab-lang.xyz"
license=('custom:boost')
depends=('gcc-libs')
makedepends=()
checkdepends=('python')
source=("https://github.com/ivan-tkatchev/tab/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8d5fc7a02838876dc20a6bacb8b55b29cec4ed529dee692c298ed7a826de5ddd')

_dirname="tab-${pkgver}"

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
