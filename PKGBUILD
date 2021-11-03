# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=octofetch-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="GitHub stats fetch tool"
arch=('x86_64')
url="https://github.com/azur1s/octofetch"
license=('MIT')
depends=('gcc-libs' 'openssl')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"LICENSE-$pkgver::$url/raw/$pkgver/LICENSE"
	"README-$pkgver::$url/raw/$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/$pkgver/octofetch")
sha256sums=('0b85b107bb5386b2b35372d2f64a8ccf5079149b239ade6bb3889753011a368c'
            '852d3f6b2f086d3e392d310773618863b24a8a7ab66391cf75b10cd6430559cb')
sha256sums_x86_64=('5462266f2be747819ab982c2755c81a05edf7c9e3c1dfb53725c17249231a400')

package() {
	install -D "$pkgname-$pkgver" "$pkgdir/usr/bin/octofetch"
	install -Dm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
