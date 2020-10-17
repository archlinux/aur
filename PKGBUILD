# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Aaron Fischer <mail@aaaron-fischer.net>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
pkgname=closure-compiler
pkgver=v20201006
pkgrel=1
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
sha512sums=('a708e014cb8dcc308433294f8fa8904626988d3e7bbe24620ef9f3d75997e3fd46d7436be01336639e4e72f886987ff348bb65930535504e84afd27eb82c2bab'
            'ec9ebb9a746bd225a1a7b5b23ff96ff73e3769b3a4fe69a985fcd228181d013e00e92f4fde87e04165e9bd44f6e2043dad793d4708d3a33048a25c57d51cbee7'
            '98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8'
            '209f7dfca8a3512580f7726edb02e9834dd35b6fd013fffed55c1f1b45555c3445c5251585c2da2dc4c8ca4ba36478a2f737e3e66d786748d7d5d91865705762')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/README.md"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/COPYING"
}
