# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certbot-dns-vultr'
pkgver='20190506'
_commit='5acb7e2b6d66f21decb3a37ed0d7ec808eefe844'
pkgrel='4'
pkgdesc='Cerbot hooks for Vultr DNS'
arch=('any')
url="https://github.com/oefd/$pkgname"
license=('MIT')
depends=('certbot' 'python' 'python-certifi' 'python-chardet' 'python-idna' 'python-requests' 'python-urllib3')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('afd6998a24c52d87f95610de1da8038e9b6701b0532ba0e40d50d17e8d2ddcfb')

package() {
	cd "$srcdir/$pkgname-$_commit/"
	install -Dm755 'vultr-hook.py' "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
