# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=nimlsp
pkgver=0.4.6
pkgrel=1
pkgdesc="Nim Language Server Protocol"
arch=(x86_64)
url="https://github.com/PMunch/nimlsp"
license=('MIT')
makedepends=(nim)
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('ad43f976326bf5d93f267dd23a67bbab')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	nimble build -d:release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/${pkgname}"
	install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/nimlsp/LICENSE"
}
