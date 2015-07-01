# $Id: PKGBUILD 94047 2013-07-13 12:36:45Z svenstaro $
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=termsql-git
_pkgname=termsql
pkgver=r56.52673c7
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Convert text from a file or from stdin into SQL table and query it instantly. Uses sqlite as backend. The idea is to make SQL into a tool on the command line or in scripts."
arch=('i686' 'x86_64')
url="http://mathema.tician.de/software/pyopencl"
license=('custom')
makedepends=('python2')
source=("git+https://github.com/tobimensch/termsql.git")
md5sums=('SKIP')
#build() {
#}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
