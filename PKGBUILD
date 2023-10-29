# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
pkgname=docoseco
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatize management of docker confgs and secrets"
url="https://github.com/Zebradil/docoseco"
arch=(any)
license=(MIT)
groups=()
backup=()
depends=(python3 python-ruamel-yaml)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
optdepends=()
conflicts=()
provides=(docoseco)
replaces=()
source=(https://files.pythonhosted.org/packages/source/d/docoseco/docoseco-1.0.0.tar.gz)
sha256sums=()
build () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    python -m build --wheel --no-isolation
}
package () 
{ 
    cd "$pkgname-$pkgver" || exit 1;
    python -m installer --destdir="$pkgdir" dist/*.whl
}
