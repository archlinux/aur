# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-polychord
pkgver=1.20.1
pkgrel=1
pkgdesc="Next generation nested sampling (python library)"
arch=(any)
url="https://github.com/PolyChord/PolyChordLite"
groups=()
depends=(gcc-fortran openmpi)
license=('custom')
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/PolyChord/PolyChordLite/archive/${pkgver}.tar.gz")
sha256sums=('6e1e0310ea3f00613ec1d9017ae0ec68d031c8f3edd7f403672b4dc8821d5772')

build() {
    cd "$srcdir/PolyChordLite-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PolyChordLite-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}

