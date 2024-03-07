# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.6
_tagver=1.6-release
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD-2-Clause')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'python-scenedetect' 'qt5-base' 'fmt')
makedepends=('python-setuptools')
source=("https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$_tagver.tar.gz")
sha256sums=('cf6c10932754c01d83da1f3176340592394bbc6e5b78aba2889bc450b0e43fa8')

package() {
  cd "DVR-Scan-$_tagver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
