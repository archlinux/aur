# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>
pkgname=cdlabelgen
pkgver=4.3.0
pkgrel=2
epoch=
pkgdesc='Generates frontcards and traycards for inserting in CD/DVD jewel cases.'
arch=('any')
url='http://www.aczoom.com/tools/cdinsert'
license=('BSD')
groups=()
depends=(perl)
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
source=("$pkgname-$pkgver.tgz::http://www.aczoom.com/pub/tools/$pkgname-$pkgver.tgz"
        "$pkgname-$pkgver.patch"
	'LICENSE')
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make BASE_DIR="$pkgdir/usr" install
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('8b6233fd43e2cb29f96d38e09a45824b'
         '898cfb93b6b9c0feeabb822a33dddbb2'
         '5fc568418a0379fc3a358ed1c2523b44')
