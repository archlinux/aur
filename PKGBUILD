# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
pkgver=8.0.1
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="http://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=('python-markdown>3.2')
makedepends=('python-setuptools')
optdepends=('python-pygments: syntax highlighting')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/facelessuser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9ba704052d4bdc04a7cd63f7db4ef6add73bafcef22c0cf6b2e3386cf4ece51e')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
