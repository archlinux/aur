# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=gscal
pkgver=0.1.1
pkgrel=0
pkgdesc="GTK Simple Calendar"
arch=(any)
url="https://github.com/Akmadan23/gscal"
license=(GPLv3)
depends=(python-gobject python-toml)
makedepends=(python-build python-setuptools python-installer python-wheel)
provides=(gscal)
conflicts=()
replaces=()
options=()
source=("https://files.pythonhosted.org/packages/fd/ee/1ff44fde8c24746777d3447b4a07463f43ff979eb667f1f60ccb08fa1fc9/gscal-0.1.1.tar.gz")
md5sums=("dbfd4fef59d004504730be44b66bc64a")
sha256sums=("a3eb0bbede7a4fa154f8c0fd266053e7bff583d3bee357c5c3ecb2a33d01b9bf")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
