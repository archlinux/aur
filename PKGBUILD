# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

pkgname=cloudprint-git
pkgver=110.d55435a
pkgrel=1
epoch=1
pkgdesc='Google cloudprint proxy for CUPS - development version'
arch=('any')
url='https://github.com/armooo/cloudprint'
license=('GPL3')
depends=('python2-pycups' 'python2-distribute' 'python2-daemon')
makedepends=('git')
provides=('cloudprint')
conflicts=('cloudprint')
source=("${pkgname}::git://github.com/armooo/cloudprint.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${pkgname}
  python2 setup.py install --root=$pkgdir/ --optimize=1 
}
