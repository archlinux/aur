# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=psautohint
pkgver=2.1.1
pkgrel=2
epoch=2
pkgdesc='A standalone version of AFDKO’s autohinter'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('Apache')
depends=('python-fonttools' 'python-fs' 'python-lxml')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('c41253b7a5566d052e92c90ecce86b719342fef4697498b8e64d2b90e1feb89c')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
