# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=solidity-language-server
pkgver=0.8.2
pkgrel=2
pkgdesc="A language server for the Solidity programming language."
arch=(any)
url="https://github.com/NomicFoundation/hardhat-vscode"
license=("MIT")
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/@nomicfoundation/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-$pkgver.tgz")
sha256sums=('cb13e12c53c585b886eeb2234535ab27a4635218126c4cc7ceffa3897278d1a3')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# See https://github.com/npm/npm/issues/9359
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	# See https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
