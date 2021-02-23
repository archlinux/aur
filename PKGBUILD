# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=psautohint
pkgver=2.3.0
pkgrel=1
epoch=2
pkgdesc='A standalone version of AFDKO’s autohinter'
arch=('x86_64')
url="https://github.com/adobe-type-tools/$pkgname"
license=('Apache')
depends=('python-fonttools' 'python-fs' 'python-lxml')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('78a45b13a475fd83e99fd637bd908d91679c5fd765993cdb6cff1f48d93c3029')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
