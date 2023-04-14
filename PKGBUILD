# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-kiutils
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="Simple and SCM-friendly KiCad file parser based on Python dataclasses"
url="https://github.com/mvnmgrx/kiutils"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fcdb6ddae050729670854b3e233e86ebb71b9c9e568908d2eb70192d6ec9988f')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
