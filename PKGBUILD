# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-intellimouse-ctl
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="A cross-platform command line tool and library for Microsoft's IntelliMouse devices."
url="https://github.com/k-visscher/intellimouse-ctl"
depends=(
    'python'
    'python-hidapi'
)
makedepends=('python-build')
license=('MIT')
arch=('any')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('04dfaaed03b0756d35907834325e7017133cdb9912a1753ebec08bf70d668c7e')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
