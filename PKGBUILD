# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=gscal
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK Simple Calendar"
arch=(any)
url="https://github.com/Akmadan23/gscal"
license=("GPL-3")
depends=(python-gobject python-toml)
makedepends=(python-build python-setuptools python-installer python-wheel)
provides=(gscal)
conflicts=()
replaces=()
options=()
source=("https://files.pythonhosted.org/packages/48/a7/79709835118ad14d1e8e8bb177976120f2a5446431c2718f76d42d363367/gscal-0.3.1.tar.gz")
md5sums=("ede434e1f6231dccccec6a6075426612")
sha256sums=("3cf5a4e85f26f851dab12faa2db0a64716a1126666dd6b467ac530c546be34b7")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
