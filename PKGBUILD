# Maintainer: X3r0Day

pkgname=specter
pkgver=0.1.0
pkgrel=1
pkgdesc="Subdomain enumeration and TCP port scanning toolkit"
arch=("any")
url="https://github.com/x3r0day/x3r0day-specter"
license=("MIT")
depends=("python" "python-rich")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
optdepends=(
  "nmap: aggressive service detection (-S) and sudo nmap mode (-U)"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")
_pybin="/usr/bin/python"

build() {
  cd "$srcdir/X3r0Day-Specter-$pkgver"
  "$_pybin" -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/X3r0Day-Specter-$pkgver"
  "$_pybin" -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
