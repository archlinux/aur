# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-picard
_name=${pkgname/-/_}
pkgver=0.8.1
pkgrel=1
pkgdesc="Preconditioned ICA for Real Data"
arch=('any')
url="https://github.com/pierreablin/picard"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scikit-learn' 'python-scipy')
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('f47547f902335129ed2cecee01025cd2f7b1691c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
