# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gfsubsets
pkgname=python-$_pyname
epoch=1
pkgver=2024.5.9
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
sha256sums=('3a0a5d70e2565f4a341f2e8b8d1b31b1930055680ace233e6ea7bf15f2678996')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
