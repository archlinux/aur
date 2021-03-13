# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.2
pkgrel=2
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD')
depends=('python-numpy' 'python-tqdm' 'opencv' 'hdf5' 'qt5-base')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("https://github.com/Breakthrough/DVR-Scan/archive/v$pkgver.tar.gz")
sha256sums=('0df4d600a72296fe191ccf5dcd6cef5e4664743679d24dd53b4707fb61154771')

package() {
  cd "DVR-Scan-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
