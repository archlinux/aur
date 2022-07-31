# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.5
_tagver=1.5-release
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'python-scenedetect' 'qt5-base' 'fmt')
makedepends=('python-setuptools')
source=("https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$_tagver.tar.gz")
sha256sums=('c0c5a819320e0ef4b0c3cb20658a9c86772939c13a776055cd386a95de87047f')

package() {
  cd "DVR-Scan-$_tagver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
