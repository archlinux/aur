# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=psautohint
pkgver=2.1.1
pkgrel=1
epoch=2
pkgdesc="A standalone version of AFDKO’s autohinter"
arch=('x86_64')
url="https://github.com/adobe-type-tools/psautohint"
license=('Apache')
depends=('python-lxml' 'python-fonttools' 'python-fs')
makedepends=('python-setuptools-scm')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('c41253b7a5566d052e92c90ecce86b719342fef4697498b8e64d2b90e1feb89c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
