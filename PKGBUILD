# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-click-man
_pyname="${pkgname#python-}"
pkgver=0.6.0
pkgrel=1
pkgdesc='Automate generation of man pages for python click applications'
arch=(any)
url="https://pypi.python.org/pypi/$_pyname"
license=(MIT)
depends=(python
         python-click)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm
             python-setuptools)
_archive="${_pyname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('53b08a1f54f2ea291fc081d120f40107b9b6134ca578e027983c1e0ef21bf19a')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
