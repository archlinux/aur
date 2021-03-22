# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=mtasc-bin
pkgver=1.12
pkgrel=3
pkgdesc="Motion-Twin ActionScript 2 Compiler"
arch=('i686' 'x86_64')
url="http://tech.motion-twin.com/${pkgname%-bin}.html"
license=('GPL')
depends=('lib32-glibc')
provides=('mtasc')
conflicts=('mtasc')
source=("http://tech.motion-twin.com/zip/${pkgname%-bin}-$pkgver-linux.tgz")
sha512sums=('41bc51025c8df7730a23dfd6dd7bdfb4065a694913834e34b3cbe7ba2508cb4372a131184a6f2fb7be42bc2e18c1178ed3a74a450f9d0c775046181aa3026916')

package() {
	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${pkgname%-bin}"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/CHANGES.txt" "$srcdir/Future.txt"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/Readme.txt"
	install -d "$pkgdir/usr/share/$pkgname/"
	cp -r -t "$pkgdir/usr/share/$pkgname/" "$srcdir/std"*
}
