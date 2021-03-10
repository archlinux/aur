# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.2
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'opencv' 'hdf5' 'qt5-base')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("https://github.com/Breakthrough/DVR-Scan/archive/v$pkgver.tar.gz")
sha256sums=('a4ccef2133bc7fc4f03b9d9c32376e8169a92a02e2ef7ca13c40a3c081850d08')

package() {
  cd "DVR-Scan-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
