# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-rst-docstrings
pkgname=python-$_pkgname

pkgver=0.3.0
pkgrel=1
pkgdesc="flake8 plugin to validate Python docstrings as reStructuredText (RST)"

url='https://github.com/peterjc/flake8-rst-docstrings'
arch=('any')
license=('MIT')

depends=('python' 'python-restructuredtext_lint')
makedepends=(python-build python-installer python-wheel)

source=("https://github.com/peterjc/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('30f4bc0eb2c3465fcf19333f0bd9feb7a4c6472faae7d4e7db9a380d530426a3aea34f6671f7442b9285a5a37b11fabbf00ae41d4260503449d51dc2039f549c')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
