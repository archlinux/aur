_pkgname="sshconf"
pkgname="python-sshconf-git"
pkgver=0.2.7.r5.gb53f00b
pkgrel=1
pkgdesc="SSH configuration reading and modification library in Python"
arch=('any')
url="https://github.com/sorend/sshconf"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-flit-core)
source=('git+https://github.com/sorend/sshconf.git')
sha256sums=('SKIP')


pkgver() {
  cd ${_pkgname}
  git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
