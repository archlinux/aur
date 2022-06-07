# Maintainer: morguldir <morguldir@protonmail.com>
_gitname=PyTMX
pkgname=python-pytmx
pkgver=3.31
_commit=2ef7dcac8526d9b5085c147b70b1078666542f12
pkgrel=1
pkgdesc="Python library to read Tiled Map Editor's TMX maps"
arch=('i686' 'x86_64')
url="https://github.com/bitcraft/$_gitname"
license=('LGPL')
depends=('python>=3.3' 'python-six')
makedepends=('git')
provides=($pkgname)
conflicts=($pkgname)
source=("git+https://github.com/bitcraft/$_gitname.git#commit=$_commit")
sha256sums=('SKIP')

package(){
  cd "$srcdir"/$_gitname
  python setup.py install --root="$pkgdir" --prefix=/usr
}

check() {
    cd "$srcdir"/$_gitname
    python -m unittest tests/pytmx/test_pytmx.py
}
