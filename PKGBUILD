# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=gfsubsets
pkgname=python-$_pyname
epoch=1
pkgver=2024.9.25
pkgrel=2
pkgdesc='Codepoint definitions for the Google Fonts subsetter'
arch=(any)
url="https://pypi.org/project//$_pyname"
license=(Apache-2.0)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('8c4b8804d43cf4b7b745b9345b83cb97d2c4eeb3f421c13a440cf27e165bee56')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
