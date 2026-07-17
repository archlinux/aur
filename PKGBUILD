# Maintainer: HaxL0p4 <haxl0p4@proton.me>
pkgname=l0p4map
pkgver=1.0.3
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
sha256sums=('a9a9ba3eb8787a169148b7fbacdab586c17ace4cf0a7a4b578812989750c1e1d')

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
