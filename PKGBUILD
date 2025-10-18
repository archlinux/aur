# Maintainer: teraflops <me@priet.usº>
# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>

pkgbase=python-tidalapi-git
pkgname=('python-tidalapi-git')
pkgver=0.8.8.r0.g29d5153
provides=('python-tidalapi')
conflicts=('python-tidalapi')
pkgrel=1
pkgdesc="Unofficial Python API for TIDAL music streaming service"
arch=('any')
url="https://github.com/EbbLabs/python-tidal"
license=('LGPL3')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+https://github.com/EbbLabs/python-tidal.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/python-tidalapi-git"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/python-tidalapi-git"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

