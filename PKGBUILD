# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
pkgname=closure-compiler
pkgver=v20201102
pkgrel=2
epoch=1
pkgdesc="A JavaScript checker and optimizer"
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('Apache')
depends=(java-runtime)
source=("https://repo.maven.apache.org/maven2/com/google/javascript/$pkgname/$pkgver/$pkgname-$pkgver.jar"
        "https://raw.githubusercontent.com/google/$pkgname/$pkgver/README.md"
        "https://raw.githubusercontent.com/google/$pkgname/$pkgver/COPYING"
        "$pkgname")
noextract=("$pkgname-$pkgver.jar")
sha512sums=('f84a7484d5c19d113f88eedb1eca1fb1de0134e74b8b0a4e88894c8c3768178f87b64aac0de44231e658e9103e7be92806b30307e6d5d99335b3fdc219d75720'
            'SKIP'
            'SKIP'
            '209f7dfca8a3512580f7726edb02e9834dd35b6fd013fffed55c1f1b45555c3445c5251585c2da2dc4c8ca4ba36478a2f737e3e66d786748d7d5d91865705762')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
