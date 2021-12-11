# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=cattrs
pkgname=python-${_pipname,,}
pkgver=1.9.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url="https://github.com/Tinche/$_pipname"
license=(MIT)
depends=(python
         python-attrs)
makedepends=(python-setuptools)
_archive="$_pipname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
sha256sums=('1ef33f089e0a494e8d1b487508356f055c865b1955b125c00c991a4358543c80')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
