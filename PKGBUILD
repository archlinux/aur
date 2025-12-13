# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=python-osfclient
pkgver=0.0.5
pkgrel=1
pkgdesc="A python library and command-line client for file storage on OSF "
arch=('any')
url="https://github.com/osfclient/osfclient"
license=('BSD-3-Clause')
depends=("python"
  "python-six"
  "python-tqdm"
  "python-requests")
makedepends=("python-build"
  "python-installer"
  "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fd9f210dead247e343db9b22dddb6982c8cd8d24b00e6535fb116ceb859b3e1f')

build() {
  cd "osfclient-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "osfclient-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
