# Maintainer: Luke Horwell <code (at) horwell (dot) me>

pkgname=('dvr-scan')
pkgver=1.6.1
_tag=1.6.1-release
pkgrel=1
pkgdesc="Tool for extracting scenes with motion from security camera/DVR footage."
arch=('any')
url="https://github.com/Breakthrough/DVR-Scan"
license=('BSD-2-Clause')
depends=('python-numpy' 'python-tqdm' 'python-opencv' 'python-scenedetect' 'qt5-base' 'fmt')
makedepends=('python-setuptools')
source=("https://github.com/Breakthrough/DVR-Scan/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('afc91733fad4d5366d83c6767b11a51dd0d183292df2eff733d84f77c017ba16')

package() {
  cd "DVR-Scan-$_tag"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
