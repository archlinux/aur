# Mantainer: MCMic <come@chilliet.eu>

pkgname=python2-pyscroll
pkgver=74402d3
pkgrel=1
pkgdesc="some basic modules to make scrolling pygame games"
arch=('any')
url="https://github.com/bitcraft/pyscroll"
license=('LGPL v3')
depends=('python2')
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
  python2 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1
}
