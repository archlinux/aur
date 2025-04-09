# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-click-man
_pyname="${pkgname#python-}"
pkgver=0.5.1
pkgrel=1
pkgdesc='Automate generation of man pages for python click applications'
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(MIT)
depends=(python
         python-click)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="${_pyname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('2db2163ef51a1b746d6d7781f78856430a2bcf0f10df428fe5986ecc0ef9809c')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
