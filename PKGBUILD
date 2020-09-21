# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fdiff
pkgver=2.0.2
pkgrel=1
pkgdesc='An OpenType table diff tool for fonts based on the fontTools TTX format'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
_py_deps=('aiodns'
          'aiofiles'
          'aiohttp'
          'fonttools')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e84a51582ccfe9b9ae3e6df06a96fa4673d47567c0e1c014af8ca6cc86cf92b5')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
