# Maintainer: Bangkah <mdhyaulatha@gmail.com>
pkgname=athaguard
desc="AthaGuard - Modular IDS/IPS Tool with Real-time Dashboard"
pkgver=1.0.1
pkgrel=1
arch=("any")
url="https://github.com/Bangkah/athaguard"
license=("MIT")
depends=(
  'python' 'python-scapy' 'python-fastapi' 'python-uvicorn' 'python-jinja' 'python-watchdog' 'python-notify2'
  'python-pandas' 'python-numpy' 'python-scikit-learn' 'python-requests' 'python-pyotp' 'python-passlib'
  'python-jose' 'python-multipart' 'iptables' 'nftables' 'ufw'
)
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/athaguard-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/athaguard-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
