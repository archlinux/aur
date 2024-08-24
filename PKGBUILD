# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Sean Haugh <seanphaugh@gmail.com>
_pkgname=exodus
_owner=Intoli
pkgname=exodus-bundler
pkgver=2.0.4
pkgrel=2
pkgdesc="Painless relocation of Linux binaries"
arch=('any')
url="https://github.com/$_owner/$_pkgname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
optdepends=('musl' 'dietlibc')
provides=("$pkgname=$pkgver")
conflicts=('exodus')
source=($_pkgname-$pkgver.tar.gz::"https://github.com/$_owner/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6dba2e0c8b4e4fcfc22d516b8efcf373afe2fc5a6346d85f3a98d411126f2446')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim: set ts=2 sw=2 noet:
