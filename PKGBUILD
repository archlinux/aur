# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-inotifyrecursive
pkgver=0.3.5
pkgrel=4
pkgdesc="Simple recursive inotify watches for Python"
arch=('any')
url="https://github.com/letorbi/inotifyrecursive"
license=('LGPL-3.0-only')
depends=(
  'python'
  'python-inotify-simple'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
