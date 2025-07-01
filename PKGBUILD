# Maintainer: adamanteye <ada@adamanteye.cc>
pkgname=tunet-bash
pkgver=1.2.8
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet-bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
optdepends=('pass: for password storing')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f40987ced45705473d47130d766222c84398f420bf193181b150e239bcb55319')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix=/usr install > /dev/null 2>&1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
