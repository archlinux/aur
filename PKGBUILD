# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.6.2
_tag=1.6.2-release
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD-2-Clause')
depends=(
  python-numpy
  python-tqdm
  python-opencv
  python-scenedetect
)
makedepends=(
  python-setuptools
)
source=("https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('fe08ebeb8011297a548f5d47b40e04d98e92d08c779b6a74a3c2e1fe23b9315d')

package() {
  cd "DVR-Scan-$_tag"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
