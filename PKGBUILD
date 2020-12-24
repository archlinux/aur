# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
pkgver=8.1
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="http://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=('python-markdown')
makedepends=('python-setuptools')
optdepends=('python-pygments: syntax highlighting')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/facelessuser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('565583c5964ac8253896ef4a7f14023075503ca6514d7d470b343290b96fc6da')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
