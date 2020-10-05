# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
pkgname=closure-compiler
pkgver=20200927
pkgrel=1
pkgdesc="A JavaScript checker and optimizer"
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('Apache')
depends=(java-runtime)
source=("https://repo.maven.apache.org/maven2/com/google/javascript/$pkgname/v$pkgver/$pkgname-v$pkgver.jar"
        "https://raw.githubusercontent.com/google/$pkgname/v$pkgver/README.md"
        "https://raw.githubusercontent.com/google/$pkgname/v$pkgver/COPYING"
        "$pkgname")
noextract=("$pkgname-v$pkgver.jar")
sha512sums=('b7f04ec8553a85b047ce572bf265b399fa887242d2f2ddbd46ddb4bbecde7e4be46130db73fc00fc51367d39a0f2fbe0e7b156a91015075905ddf2d466973785'
            '6305b76b59cc86dc7686328e74e693daa092ff3965b3a8a9782622a315022afd3d8c7c73c48a4069ddf79792e2b7d90d35a82e4cdd2c580660d005d11283c411'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8'
            '209f7dfca8a3512580f7726edb02e9834dd35b6fd013fffed55c1f1b45555c3445c5251585c2da2dc4c8ca4ba36478a2f737e3e66d786748d7d5d91865705762')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 "$srcdir/$pkgname-v$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/README.md"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/COPYING"
}
