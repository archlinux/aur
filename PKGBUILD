# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.4
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'qt5-base' 'fmt')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("https://github.com/Breakthrough/DVR-Scan/archive/v$pkgver.tar.gz")
sha256sums=('eefd0d39e34ec5c5ef8bb15e83e7eab75071fd6eb5eefe8900e89634d8648632')

package() {
  cd "DVR-Scan-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
