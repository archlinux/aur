# Maintainer: Ivan <ivan@primaguna.com>
pkgname=python-waypaste
pkgver=0.1.1
pkgrel=1
pkgdesc="Clipboard image saver for Wayland/Sway"
arch=('any')
url="https://github.com/ivanp/waypaste"
license=('MIT')
depends=('python' 'python-gobject' 'wl-clipboard' 'libnotify')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:7:1}/${pkgname:7}/${pkgname:7}-${pkgver}.tar.gz")
sha256sums=('c8e8ce79c4fe9b61bb01cd778c887bee34628689dca8c24218befcbdb9bf1747')

build() {
    cd "${pkgname:7}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname:7}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
