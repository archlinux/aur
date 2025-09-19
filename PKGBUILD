# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-picard
pkgver=0.8
pkgrel=2
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
source=(https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
sha1sums=('e15bd042bc8811c259308d2af3066ed90f9c3c7f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
