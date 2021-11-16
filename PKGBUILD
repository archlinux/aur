# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.3
pkgrel=2
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'qt5-base' 'fmt')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("https://github.com/Breakthrough/DVR-Scan/archive/v$pkgver.tar.gz")
sha256sums=('3bf13f19d207f0d245b3154a316c32b09b798706a9467af1a38f0cde863f6f4b')

package() {
  cd "DVR-Scan-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
