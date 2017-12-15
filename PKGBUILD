# Mantainer: MCMic <come@chilliet.eu>

pkgname=python-pyscroll
pkgver=cfe684f
pkgrel=1
pkgdesc="some basic modules to make scrolling pygame games"
arch=('any')
url="https://github.com/bitcraft/pyscroll"
license=('LGPL v3')
depends=('python')
makedepends=('git')
source=("git://github.com/bitcraft/pyscroll.git")
md5sums=(SKIP)
_gitname='pyscroll'

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
