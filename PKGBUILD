# Maintainer: Sam Garfield
# Contributor: Sam1am <noreply@merrythieves.com>

pkgname=ryzen-master-commander
_realname=Ryzen-Master-Commander 
pkgver=1.0.8
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
sha256sums=('25556c7d22903697734e9c8fc996621a8bbbb061096067ffa26a0ca52f53af46')
