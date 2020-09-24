# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
pkgname=closure-compiler
pkgver=20200920
pkgrel=1
pkgdesc="A JavaScript checker and optimizer"
arch=('any')
url="https://developers.google.com/closure/compiler/"
license=('Apache')
depends=(java-runtime)
source=("$pkgname"
        "https://repo.maven.apache.org/maven2/com/google/javascript/$pkgname/v$pkgver/$pkgname-v$pkgver.jar"
        "https://raw.githubusercontent.com/google/$pkgname/v$pkgver/README.md"
        "https://raw.githubusercontent.com/google/$pkgname/v$pkgver/COPYING")
noextract=("$pkgname-v$pkgver.jar")
sha512sums=('209f7dfca8a3512580f7726edb02e9834dd35b6fd013fffed55c1f1b45555c3445c5251585c2da2dc4c8ca4ba36478a2f737e3e66d786748d7d5d91865705762'
            'b270d139f2295a96d8c1896ec79aeb56e8c7892aaccc3d118d70717ab8f2c6d7712df3730c37d24c8481c38a8f73a6e0f8a75a83cfb7de25172c1a2a175c3909'
            '0476dc36c44160b33cd20046734e20ba02f143bfda9395985c55dd68fe9dbbfb019e5b1d7aa9ea4b75e03d99f5c692ab03448505f792bc776618e26dc3c29a93'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 "$srcdir/$pkgname-v$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/README.md"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/COPYING"
}
