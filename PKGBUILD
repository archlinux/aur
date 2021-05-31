# Maintainer: Yujeonja <hardboiled65@gmail.com>
pkgname=httproto
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="HTTP protocol library."
arch=('x86_64')
url="https://github.com/hardboiled65/httproto"
license=('MIT')
groups=()
depends=('http-parser>=2.9.4')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/hardboiled65/httproto/archive/v0.1.2.tar.gz")
noextract=()
md5sums=('f957a54aa4e39b8f10c1d6abc3706241')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname-$pkgver"
	DEBUG=0 make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -D -m 644 "$srcdir/$pkgname-$pkgver"/LICENSE "${pkgdir}"/usr/share/licenses/httproto/LICENSE
}
