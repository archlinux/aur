# Maintainer: A Frederick Christensen <fauxmight@nosocomia.com>
# Contributor: Augusto Roccasalva <augusto@rioplomo.com.ar>

_pkgname=todotxt-machine
pkgname=$_pkgname-git
pkgver=bbd6457
pkgrel=1
pkgdesc="Interactive terminal todo.txt file editor with an interface similar to mutt"
url="https://github.com/AnthonyDiGirolamo/todotxt-machine"
arch=('any')
license=('GPL3')
depends=('python' 'python-urwid' 'python-docopt')
makedepends=('python-setuptools')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("https://pypi.python.org/packages/source/t/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')
source=("$_pkgname::git://github.com/AnthonyDiGirolamo/todotxt-machine")

pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
