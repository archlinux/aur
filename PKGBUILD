# Maintainer: Guilherme Rugai Freire <dev at grfreire dot com>

pkgname="go-andotp"
pkgver=1.0.23
pkgrel=2
pkgdesc="CLI program to encrypt/decrypt andOTP files"
arch=('x86_64')
url="https://github.com/RijulGulati/go-andotp"
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RijulGulati/go-andotp/archive/v$pkgver.tar.gz")
sha256sums=('8a268f54374e9960a7d7f8163e59e1357a614048fa8aa6b263bbe7feebadd07c')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	go build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 go-andotp "${pkgdir}/usr/bin/go-andotp"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

