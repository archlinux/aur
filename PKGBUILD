# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.5.1
_tagver=1.5.1-release
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'python-scenedetect' 'qt5-base' 'fmt')
makedepends=('python-setuptools')
source=("https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$_tagver.tar.gz")
sha256sums=('50da7f79b37ad1281a1282fdbdff4a9dda311334287334664b559b59431a7a16')

package() {
  cd "DVR-Scan-$_tagver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
