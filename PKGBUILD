# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=solidity-language-server
pkgver=0.7.2
pkgrel=1
pkgdesc="A language server for the Solidity programming language."
arch=(any)
url="https://github.com/NomicFoundation/hardhat-vscode"
license=(MIT)
makedepends=(npm)
source=("https://registry.npmjs.org/@nomicfoundation/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-$pkgver.tgz")
sha256sums=('7ef5f3801e11923fb3e9aa54ef6ea277af1123af5142289615bc27d1cd0a4fe9')

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

	# See https://github.com/npm/npm/issues/9359
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	# See https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
