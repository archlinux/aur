# Contributor: YeahSure <lapdogpdx.yahoo.com>

pkgname=colout-git
pkgver=1.1.r7.g6a8fe89
pkgrel=1
pkgdesc="Reads text on stdin and produces colorized and stylized output"
arch=('any')
url="https://github.com/nojhan/colout"
license=('GPL-3.0-or-later')
depends=('python-pygments' 'python-babel')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
provides=('colout')
conflicts=('colout')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:
