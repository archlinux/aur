# Maintainer: HaxL0p4 <haxl0p4@proton.me>
pkgname=l0p4map
pkgver=1.0.1
pkgrel=1
pkgdesc="Professional network monitoring & visualization tool combining ARP discovery with nmap"
arch=('any')
url="https://github.com/HaxL0p4/L0p4Map"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-scapy'
    'python-psutil'
    'python-requests'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'nmap'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HaxL0p4/L0p4Map/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23f17c8d0c8225bb6a51b148cb0445e09c954628744dd3302e681b8465d43107')

build() {
    cd "L0p4Map-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "L0p4Map-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
