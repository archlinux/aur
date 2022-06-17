# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=sre-yield
__pyname=${_pyname/-/_} # project is transitioning, tagged release is earlier scheme
pkgname=python-$_pyname
pkgver=1.2
pkgrel=1
pkgdesc='Generate regular all expression matches'
arch=(any)
url="https://github.com/$_pyname/$_pyname"
license=(Apache)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$__pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$__pyname/$_archive.tar.gz")
sha256sums=('e94f1a2a3cbafffe1dcd15c1d54e401a1517e052aa64c7d3164f88dc761d7b8a')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
