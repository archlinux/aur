# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
pkgname=closure-compiler
pkgver=20200719
pkgrel=2
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
            '12abfa0522cfad62427e990dd3de4de5b31412d67e6ddae35f36de8ba010fa78308b9f62cdbf262b47b3520b8138b0147e778de17abcdd55e4d55344f3f37584'
            'aeecfc4b004e641de5824a4400e00fa81f41bb1fc748f6c42f8e0d6ef4cfa584c2c81bbacb56786a69a25f0f939c3c1db539bc94d861f825e718438f20967071'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 "$srcdir/$pkgname-v$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/README.md"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/COPYING"
}
