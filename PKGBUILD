# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=python2-cyclone-git
pkgver=r742.b8d3f1c
pkgrel=1
pkgdesc="Twisted based Tornado framework clone"
license=('apache')
url="http://github.com/fiorix/cyclone"
source=('git://github.com/fiorix/cyclone.git')
md5sums=('SKIP')
_gitname="cyclone"
arch=(any)
conflicts=('python2-cyclone')
provides=('python2-cyclone')
makedepends=('git' 'python2-distribute')
depends=('python2-twisted')

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}


