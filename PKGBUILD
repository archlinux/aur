# Maintainer: takeshix <dizzy [at] adversec [dot] com>

_gitname=dizzy
pkgname="${_gitname}-git"
pkgver=2.0.c44b8ff
pkgrel=1
pkgdesc='Network and USB protocol fuzzing toolkit'
url='https://github.com/ernw/dizzy'
arch=('any')
license=('BSD-3-Clause')
depends=('python' 'python-setuptools')
makedepends=('git')
provides=('dizzy_cmd')
conflicts=('dizzy_cmd')
source=("${_gitname}::git+https://github.com/ernw/dizzy.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//'|sed 's/\-/_/')" \
                 "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_gitname}
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sw=2
