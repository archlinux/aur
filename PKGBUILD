# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
pkgname=python-powerline-taskwarrior
pkgver=2.0.0
pkgrel=2
pkgdesc="Powerline segment for showing information from Taskwarrior task manager"
url="https://github.com/Zebradil/powerline-taskwarrior"
arch=(any)
license=(MIT)
groups=()
backup=()
depends=(python3 powerline)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=()
conflicts=()
provides=()
replaces=()
source=(https://files.pythonhosted.org/packages/source/p/powerline-taskwarrior/powerline-taskwarrior-2.0.0.tar.gz)
sha256sums=()
build () 
{ 
    cd "$_name-$pkgver" || exit 1;
    python -m build --wheel --no-isolation
}
package () 
{ 
    cd "$_name-$pkgver" || exit 1;
    python -m installer --destdir="$pkgdir" dist/*.whl
}
