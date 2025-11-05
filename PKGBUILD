# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gfsubsets
pkgname=python-$_pyname
epoch=1
pkgver=2025.11.4
pkgrel=1
pkgdesc='Codepoint definitions for the Google Fonts subsetter'
arch=(any)
url="https://pypi.org/project//$_pyname"
license=(Apache-2.0)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('93a5256bda8aff54b2d9986e9ea15cc9aff48670d912fe27a6da2079fbed8a49')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
