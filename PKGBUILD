# Maintainer: Sean Haugh <seanphaugh@gmail.com>
_pkgname=exodus
_owner=Intoli
pkgname=exodus-bundler
pkgver=1.1.6
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
md5sums=('537a9f05c9634e8e5b30a56c3e9cc4f9')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 noet:
