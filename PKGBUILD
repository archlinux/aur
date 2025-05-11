# Maintainer: Sam Garfield
# Contributor: Sam1am <noreply@merrythieves.com>

pkgname=ryzen-master-commander
_realname=Ryzen-Master-Commander 
pkgver=1.0.7
pkgrel=1
pkgdesc="TDP and fan control for AMD Ryzen processors"
arch=('any')
url="https://github.com/sam1am/$_realname"
license=('MIT')
depends=('python-pyqt5' 'python-pyqtgraph' 'python-numpy' 'python-matplotlib' 'python-pillow' 'python-pystray' 'ryzenadj' 'nbfc-linux-git')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sam1am/$_realname/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$_realname-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('6570033670f32cb2c5351aede37138cfce2ca534cace55f53d7f00fc0d2a7f8c')
