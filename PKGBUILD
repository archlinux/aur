# Maintainer: willemw <willemw12@gmail.com>

_pkgname=python2-code-chat
pkgname=$_pkgname-git
pkgver=r526.8536898ac3f4
pkgrel=1
pkgdesc="Source code to HTML translator (literate programming)"
arch=('any')
url="https://bitbucket.org/bjones/documentation/overview"
license=('GPL3')
depends=('python2-docutils')
makedepends=('mercurial' 'python2-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::hg+https://bitbucket.org/bjones/documentation)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd $pkgname
  sed -i 's/env python/env python2/' setup.py
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

