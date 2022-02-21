# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.4.1
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'qt5-base' 'fmt')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('86cf496b8f6acfce3c112270481fdf03df61563dd5e4af73b50d063dce097710')

package() {
  cd "DVR-Scan-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
