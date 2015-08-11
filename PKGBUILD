# Maintainer: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname="python2-pytmx"
pkgver=r244.9102f17
pkgrel=1
pkgdesc="Python library to read Tiled Map Editor's TMX maps"
arch=('i686' 'x86_64')
url="https://github.com/bitcraft/PyTMX"
license=('LGPL')
depends=('python2' 'python2-six')
makedepends=('git' 'python2-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('git://github.com/bitcraft/PyTMX.git')
md5sums=('SKIP')
_gitname=("PyTMX")

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd ${_gitname}
  python2 setup.py install --root="$pkgdir" --prefix=/usr
}

