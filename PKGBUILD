# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-mouser
_name=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="Mouser Python API"
url="https://github.com/sparkmicro/mouser-api/"
depends=(
    'python'
    'python-click'
    'python-requests'
)
makedepends=(python-build python-installer python-wheel)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('42e43b17e797bfc2b7a8323585ad8e772a8ba69d58439021635945cc0869cd5f')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
