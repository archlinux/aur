# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=tunet_bash
pkgver=1.2.7
pkgrel=1
pkgdesc="清华大学校园网准入脚本."
arch=('any')
url='https://github.com/adamanteye/tunet_bash'
license=('MIT')
depends=('bash' 'curl' 'openssl')
optdepends=('pass: for password storing')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1733ff0d39b91e069dcc269c62f28b8de62bd75a209ece5f1e1c431bf7be0b3')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix=/usr install > /dev/null 2>&1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
