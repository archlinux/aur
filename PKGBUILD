# Maintainer: Nicolas Martyanoff <khaelin@gmail.com>
# Contributor: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname="closure-compiler"
pkgver="v20210907"
pkgrel="2"
epoch="1"
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

sha512sums=(
    "b7051704edccbf221054471ed3690b617d9e32b3d4ba25d702f03b664b5f4a5e2dbec05741831e1027dda593fa4a8c28ddc82cea926c946f659db77b3f327973"
    "SKIP"
    "SKIP"
    "209f7dfca8a3512580f7726edb02e9834dd35b6fd013fffed55c1f1b45555c3445c5251585c2da2dc4c8ca4ba36478a2f737e3e66d786748d7d5d91865705762")

package() {
	cd "$srcdir"

	install -D -m755 -t $pkgdir/usr/bin $pkgname
	install -D -m644 $pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
	install -D -m644 -t $pkgdir/usr/share/doc/$pkgname README.md
	install -D -m644 -t $pkgdir/usr/share/licenses/$pkgname COPYING
}
