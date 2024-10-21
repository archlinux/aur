# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname="closure-compiler"
pkgver="v20240317"
pkgrel="1"
pkgdesc="A JavaScript checker and optimizer"
url="https://github.com/google/closure-compiler"
license=("Apache")
arch=("any")
depends=("java-runtime")

source=(
    "https://repo.maven.apache.org/maven2/com/google/javascript/$pkgname/$pkgver/$pkgname-$pkgver.jar"
    "https://raw.githubusercontent.com/google/$pkgname/$pkgver/README.md"
    "https://raw.githubusercontent.com/google/$pkgname/$pkgver/LICENSE"
    "$pkgname"
)

noextract=("$pkgname-$pkgver.jar")

sha256sums=('6b1250ac21c05bdd209dc515d9b6037b30b5555a284dd741ff0591a82848b7ce'
            'f2a1671d85bcb9257c87bb98263fa39a937e0fb12924e418e361ac7cd28efe79'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '3935fadb64cfff482029143a270ba8f952436bd6a6ab0e26151fe0785ce6265d')

package() {
	cd "$srcdir"

	install -D -m755 -t $pkgdir/usr/bin $pkgname
	install -D -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	install -D -m644 -t $pkgdir/usr/share/doc/$pkgname README.md
	install -D -m644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE
}
