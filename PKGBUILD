# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=gscal
pkgver=0.3.0
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
source=("https://files.pythonhosted.org/packages/40/c1/6764b442c9b656cafda4c56ebc4abdb04f98e1d437a7d5a49836047099c5/gscal-0.3.0.tar.gz")
md5sums=("d3b09fcae421b5d82b2c0adb64be490c")
sha256sums=("5490dbbebf97c81be64086f1b29cdd2c6813817edc7428753db395e08f35ff37")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
