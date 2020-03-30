# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fdiff
pkgver=1.0.2
pkgrel=1
pkgdesc='An OpenType table diff tool for fonts based on the fontTools TTX format'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-aiodns' 'python-aiofiles' 'python-aiohttp' 'python-fonttools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('abae9c875961d7e6641d78076bae34880b02a6c302ebea00f5c1288237d85902')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
