# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=gscal
pkgver=0.2.0
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
source=("https://files.pythonhosted.org/packages/8b/5c/d23318dcabc8cf2cdcd41e3938c2286f88efc10079992d768658b025bc8d/gscal-0.2.0.tar.gz")
md5sums=("771fa7079a34cb9c60c53ff453346669")
sha256sums=("5269a21c60bdd9c58c2197354d551a8de74fd1efb76fb03e9d90cb14385e863b")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
