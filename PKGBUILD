# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url="https://github.com/Tinche/$_pipname"
license=(MIT)
depends=(python
         python-attrs)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('5c121ab06a7cac494813c228721a7feb5a6423b17316eeaebf13f5a03e5b0d53')

build() {
	cd "$_pipname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pipname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
