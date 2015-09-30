# Maintainer: Laércio de Sousa <laerciosousa@sme-mogidascruzes.sp.gov.br>
pkgname=python2-pycha-hg
pkgver=287.e3e270a0e7ae
pkgrel=1
pkgdesc="Pycha is a very simple Python package for drawing charts"
arch=('any')
url="http://bitbucket.org/lgs/pycha/"
license=('LGPL')
depends=('python2')
makedepends=('python2-distribute' 'mercurial')
source=hg+https://bitbucket.org/lgs/pycha
md5sums=('SKIP')
_hgrepo="pycha"

pkgver() {
  cd $srcdir/${_hgrepo}
  hg update > /dev/null
  echo $(hg identify -n).$(hg identify -i)
}

package() {
  cd "$srcdir/$_hgrepo"
  python2 setup.py install --root=$pkgdir
}
