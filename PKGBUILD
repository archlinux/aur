# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=pdlist-git
pkgver=r28.b7b449e
pkgrel=1
pkgdesc="A passive subdomain finder"
arch=(any)
url="https://github.com/gnebbia/pdlist"
license=('BSD')
depends=('python' 'python-setuptools' 'python-requests' 'python-dnsdumpster-api')
makedepends=('git')
provides=("pdlist")
conflicts=("pdlist")
source=('git+https://github.com/gnebbia/pdlist.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="${pkgdir}/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

