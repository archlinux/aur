# Maintainer: Raphael <raphael.girard.iut@gmail.com>
pkgname=something-x
pkgver=1.2.2
pkgrel=1
pkgdesc="GTK4 device manager for Nothing earbuds on Linux"
arch=('any')
url="https://github.com/SoaOaoS/nothingonmarchy"
license=('MIT')
depends=('python' 'python-gobject' 'python-dbus' 'gtk4' 'libadwaita')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('libpulse: volume control via pactl')
source=("https://files.pythonhosted.org/packages/source/s/something-x/something_x-${pkgver}.tar.gz")
sha256sums=('362f1b762939f4cebf605c5e9df6266a936d198cdae48925e8be53816a77dd32')

build() {
    cd "something_x-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "something_x-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
