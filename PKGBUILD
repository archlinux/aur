# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=prettier-plugin-solidity
pkgver=1.1.3
pkgrel=1
pkgdesc="A Prettier plugin for automatically formatting your Solidity code."
arch=(any)
url="https://github.com/prettier-solidity/${pkgname}"
license=(MIT)
depends=(nodejs prettier)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-$pkgver.tgz")
sha256sums=('ae248c815621e78cdb271cfacfa79adaff88d4b680e9ee6b0d4807778651f5bc')

package() {
	npm install -g --prefix "$pkgdir/usr" --no-bin-links "$srcdir/$pkgname-$pkgver.tgz"

	# See https://github.com/npm/npm/issues/9359
	find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

	# See https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
