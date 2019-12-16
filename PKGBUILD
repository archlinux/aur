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
md5sums=('88501cab06d6dfd7da76619bc9f6b55a')

package() {
	cd "$srcdir/$pkgname-$_commit/"
	install -Dm755 'vultr-hook.py' "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
