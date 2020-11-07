# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=psautohint
pkgver=2.1.2
pkgrel=1
epoch=2
pkgdesc='A standalone version of AFDKO’s autohinter'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('Apache')
depends=('python-fonttools' 'python-fs' 'python-lxml')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('fb5761ad7e3fa6adf0266ea8b50de6afd04e95fdef32fa4e70a318889e3bbf44')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
