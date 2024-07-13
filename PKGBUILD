# Maintainer: randomTWdude
pkgname=fumosay
pkgver=1.1.9
pkgrel=1
pkgdesc='cowsay with fumofumos written in C.'
arch=('x86_64')
url='https://github.com/randomtwdude/fumosay'
license=('BSD-3-Clause')
depends=('glibc')
source=("https://github.com/randomtwdude/fumosay/releases/download/fumo${pkgver}/fumosay-${pkgver}.tar.gz")
sha512sums=('119fe2c2952ce45f317ee8f31e16d5c8f0521ac94fc3d02ae92b37ac6b384feaba3ca88455a2c1292fc97d908624793d2789eed03a2486b06cd7b14545976d91')

build() {
	cd "$pkgname-$pkgver"
	gcc -o fumosay fumosay.c
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 fumosay -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
