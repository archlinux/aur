# Maintainer: takeshix <deen [at] adversec [dot] com>

_gitname=deen
pkgname="${_gitname}-git"
pkgver=0.7.9.0a44bc7
pkgrel=1
pkgdesc='Generic data encoding/decoding application built with PyQt5'
url='https://github.com/takeshixx/deen'
arch=('any')
license=('Apache 2.0')
depends=('python' 'python-setuptools' 'python-pyqt5')
optdepends=('python-pyopenssl')
makedepends=('git')
provides=('deen')
conflicts=('deen')
source=("${_gitname}::git://github.com/takeshixx/deen.git")
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
