# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fdiff
pkgver=2.1.5
pkgrel=1
pkgdesc='An OpenType table diff tool for fonts based on the fontTools TTX format'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
_py_deps=('aiodns>=2.0.0'
          'aiofiles>=0.6.0'
          'aiohttp>=3.7.4'
          'fonttools>=4.22.1')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('691400b99ce65dfbfc8be2973158e72b59fdfad98074072ac0c335ff0482a66e')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
