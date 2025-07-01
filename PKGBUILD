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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8b126f2b1656da1104daa286f34b23f7115071f6f3a7af05a68008209a53973')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix=/usr install > /dev/null 2>&1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
