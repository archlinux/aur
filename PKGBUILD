# Maintainer: Sean Haugh <seanphaugh@gmail.com>
_pkgname=exodus
_owner=Intoli
pkgname=exodus-bundler
pkgver=1.1.9
pkgrel=1
pkgdesc="Painless relocation of Linux binaries"
arch=('any')
url="https://github.com/$_owner/$_pkgname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver-$pkgrel")
conflicts=('exodus')
source=("https://github.com/$_owner/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('fcccb457573133219409af93d045899e')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim: set ts=2 sw=2 noet:
