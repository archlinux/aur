# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=eject-applet
pkgver=0.1.1
pkgrel=3
pkgdesc="Simple external disk manager that sits in the tray"
arch=(any)
url="https://github.com/Akmadan23/eject-applet"
license=("GPL3")
depends=(python-gobject xdg-utils)
makedepends=(python-build python-setuptools python-installer python-wheel)
provides=(eject-applet)
conflicts=()
replaces=()
options=()
source=("https://files.pythonhosted.org/packages/2a/3a/4c6c7db985f8f8192f5675f060a7627f129ee8968526f14d35158c1b603a/eject-applet-0.1.1.tar.gz")
md5sums=("9d466727856552b84ae03235451e0834")
sha256sums=("f8a20ee8ed6e2347a858f3fdc252b47725e6da92baf763458b9952377bad9525")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
