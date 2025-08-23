# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.8
_tag=1.8-release
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
sha256sums=('22b5932e51b0e429362fd384f095c2032613358907997e12e6ccf65cf0064a14')

package() {
  cd "DVR-Scan-$_tag"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
