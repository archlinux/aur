# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fdiff
pkgver=2.1.3
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
sha256sums=('1da20b6062550eb4a4f4e8b84a80469832e98fe7ad82951d452520d3cb3fd861')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
