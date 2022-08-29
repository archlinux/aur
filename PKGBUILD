# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname="closure-compiler"
pkgver="v20220803"
pkgrel="1"
pkgdesc="A JavaScript checker and optimizer"
url="https://github.com/google/closure-compiler"
license=("Apache")
arch=("any")
depends=("java-runtime")

source=(
    "https://repo.maven.apache.org/maven2/com/google/javascript/$pkgname/$pkgver/$pkgname-$pkgver.jar"
    "https://raw.githubusercontent.com/google/$pkgname/$pkgver/README.md"
    "https://raw.githubusercontent.com/google/$pkgname/$pkgver/COPYING"
    "$pkgname"
)

noextract=("$pkgname-$pkgver.jar")

sha256sums=(
    "d61fbf8b672c57fac274c54e16ca0d1bf1ebcc67d43cf1047c079150a9cf352b"
    "SKIP"
    "SKIP"
    "3935fadb64cfff482029143a270ba8f952436bd6a6ab0e26151fe0785ce6265d"
)

package() {
	cd "$srcdir"

	install -D -m755 -t $pkgdir/usr/bin $pkgname
	install -D -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	install -D -m644 -t $pkgdir/usr/share/doc/$pkgname README.md
	install -D -m644 -t $pkgdir/usr/share/licenses/$pkgname COPYING
}
