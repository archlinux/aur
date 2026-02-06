# Maintainer: Bangkah <mdhyaulatha@gmail.com>
pkgname=ids-ips-tool
desc="Modular IDS/IPS Tool with Real-time Dashboard"
pkgver=1.0.1
pkgrel=1
arch=("any")
url="https://github.com/Bangkah/IDS-IPS-Tool"
license=("MIT")
depends=(
  'python' 'python-scapy' 'python-fastapi' 'python-uvicorn' 'python-jinja' 'python-watchdog' 'python-notify2'
  'python-pandas' 'python-numpy' 'python-scikit-learn' 'python-requests' 'python-pyotp' 'python-passlib'
  'python-python-jose' 'python-multipart' 'iptables' 'nftables' 'ufw'
)
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/IDS-IPS-Tool-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/IDS-IPS-Tool-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
