# Maintainer: X3r0Day

pkgname=specter
pkgver=2.3.0
pkgrel=1
pkgdesc="Subdomain enumeration and TCP port scanning toolkit"
arch=("any")
url="https://github.com/NCRIF/Specter"
license=("GPL3")
depends=("python" "python-rich" "nmap")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")
_pybin="/usr/bin/python"

build() {
  cd "$srcdir"/Specter-"$pkgver"
  "$_pybin" -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/Specter-"$pkgver"
  "$_pybin" -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
