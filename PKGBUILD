# Maintainer: Sam Garfield
# Contributor: Sam1am <noreply@merrythieves.com>

pkgname=ryzen-master-commander
_realname=Ryzen-Master-Commander 
pkgver=1.0.2
pkgrel=1
pkgdesc="TDP and fan control for AMD Ryzen processors"
arch=('any')
url="https://github.com/sam1am/$_realname"
license=('MIT')
depends=('python-pyqt5' 'python-pyqtgraph' 'python-numpy' 'python-matplotlib' 'python-pillow' 'python-pystray')
optdepends=('ryzenadj: required for TDP adjustment features'
            'nbfc-linux-git: required for fan control features')
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
sha256sums=('e063face16e8bd5561aeea362a8bc243d5b3de9de4c52eaf968fdd2e7ea064d2')
