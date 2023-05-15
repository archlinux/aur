# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=solidity-language-server
pkgver=0.6.14
pkgrel=1
pkgdesc="A language server for the Solidity programming language."
arch=(any)
url="https://github.com/NomicFoundation/hardhat-vscode"
license=(MIT)
makedepends=(npm)
source=("https://registry.npmjs.org/@ignored/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-$pkgver.tgz")
sha256sums=('b754c441d59285dfb45a07529f7cd8d0e22fce5029d31bd458dc6e7053f836ab')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# See https://github.com/npm/npm/issues/9359
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	# See https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
