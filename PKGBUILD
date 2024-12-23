# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-click-man
_pyname="${pkgname#python-}"
pkgver=0.5.0
pkgrel=2
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
sha256sums=('2c2b3016c533dd315fa45ef9ab9bfa5bfd71017ea6d5bbcd454c179aee6b2343')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
