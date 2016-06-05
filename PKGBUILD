# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

_pkgname=lice
pkgname=python-lice-git
pkgver=0.4.52.gb99300b
pkgrel=1
pkgdesc="Generate license files for your projects"
arch=(any)
url="https://github.com/licenses/lice"
license=('BSD-3')
groups=()
depends=('python')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe | sed 's/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
