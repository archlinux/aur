# Maintainer: Rider_ranger47 <aci747@engineer.com>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

pkgname=cloudprint-git
pkgver=165.108b9f0
pkgrel=1
epoch=1
pkgdesc='Google cloudprint proxy for CUPS - development version'
arch=('any')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse 
--short HEAD)"
}
url='https://github.com/armooo/cloudprint'
license=('GPL3')
depends=('python2-pycups' 'python2-distribute' 'python2-daemon' 
'python2-configargparse')
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
