# Maintainer: Azad Ahmadi <azadahmadi@mailo.com>
pkgname=eject-applet
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple external disk manager that sits in the tray"
arch=(any)
url="https://github.com/Akmadan23/eject-applet"
license=("GPL-3")
depends=(python-gobject)
makedepends=(python-build python-setuptools python-installer python-wheel)
provides=(eject-applet)
conflicts=()
replaces=()
options=()
source=("https://files.pythonhosted.org/packages/c7/51/06ed9fa5dce94404b9d9c4458ae8f3c718fbe312ce0b5ceca113fa29f4f7/eject-applet-0.1.0.tar.gz")
md5sums=("b101b948dbb57f42ace7d07a406fabc3")
sha256sums=("0fff216796df98c8c6caae14ea2a5e090906eb207534a24d0f36efa94e2d5bfc")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
