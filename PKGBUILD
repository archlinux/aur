# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=gscal
pkgver=0.1.0
pkgrel=0
pkgdesc="GTK Simple Calendar"
arch=(any)
url="https://github.com/Akmadan23/gscal"
license=(GPLv3)
depends=(python-gobject python-toml)
makedepends=(python-build python-installer python-wheel)
provides=(gscal)
conflicts=()
replaces=()
options=()
source=("https://files.pythonhosted.org/packages/14/40/4edc4d95d30d7c452fe3603f2e52f2b85b165a28e137eef8f2f0d0cedc56/gscal-0.1.0.tar.gz")
md5sums=("3144988fa8019b964a1000d32cb19db0")
sha256sums=("a00d2130650568000026afa7a780b5e12680f01b9033a3bf6c8a571001c3aad4")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
