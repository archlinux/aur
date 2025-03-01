# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.7
_tag=1.7-release
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
sha256sums=('7e1d291df6184dab8fbd79e2639c90f8b2fe4f8c5c73265ed39f03f79b3167dd')

package() {
  cd "DVR-Scan-$_tag"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
