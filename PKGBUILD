# Maintainer: Pascal Lynxon <gfcwfzkm@protonmail.com>

pkgname=vacask-bin
pkgver=0.3.4.rc1
pkgrel=1
pkgdesc='Verilog-A Circuit Analysis Kernel'
arch=('x86_64')
url='https://codeberg.org/arpadbuermen/VACASK'
license=('AGPL3')
depends=('gcc-libs' 'glibc' 'ncurses' 'openvaf-reloaded' 'suitesparse' 'zlib' 'zstd')
provides=("vacask=${pkgver}")
conflicts=('vacask')
options=(!strip)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/arpadbuermen/VACASK/releases/download/_$pkgver/vacask_${pkgver}_linux-x86_64.tar.gz")
sha256sums=('b7d490aab7654635bb74af95301cecdf9997023da02cd9ea4be1ced4ca624a26')

package() {
	cd "vacask_${pkgver}_linux-x86_64"

	install -Dm755 bin/vacask "$pkgdir/usr/bin/vacask"

	install -d "$pkgdir/usr/share/doc/$pkgname"
	cp -a share/doc/vacask/. "$pkgdir/usr/share/doc/$pkgname/"

	install -Dm644 share/doc/vacask/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
