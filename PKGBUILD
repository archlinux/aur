# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url="https://github.com/Tinche/$_pipname"
license=(MIT)
depends=(python
         python-attrs)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
_archive="$_pipname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
sha256sums=('211800f725cdecedcbcf4c753bbd22d248312b37d130f06045434acb7d9b34e1')

build() {
	cd "$_archive"
	python setup.py build
}

build() {
	cd "$_archive"
	python setup.py test
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
