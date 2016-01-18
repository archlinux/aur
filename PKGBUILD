# Maintainer: Trevor <assviolat0r at live dot com>

pkgname=python-rivescript
pkgver=1.0
pkgrel=1
pkgdesc="Rendering Intelligence Very Easily"
arch=('any')
license=('MIT')
depends=('python2' 'python-six' 'python2-six' 'python-setuptools' 'python2-setuptools')
makedepends=('git')
url='https://github.com/aichaos/rivescript-python'
source=('git+https://github.com/aichaos/rivescript-python.git')
md5sums=('SKIP')
_gitname=rivescript-python

pkgver () {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git describe --always | sed 's/-/./g')
}

build() {
   python setup.py build
}

package() {
   cd "$srcdir/$_gitname"
   python setup.py install --prefix=/usr --root="${_gitname}" --optimize=1 || return 1
}
