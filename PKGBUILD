# Maintainer: adamanteye <ada@adamanteye.cc>
pkgname=tunet_bash
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
sha256sums=('b521143e2c7736ddc40ad3b4cae6e3ca17cdac1aacc7877c454dda0ffde962f9')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix=/usr install > /dev/null 2>&1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
