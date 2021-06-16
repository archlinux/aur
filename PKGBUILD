# Maintainer: Andrei Pavel <andrei.pavel@cti.pub.ro>
_gitrepository='avl'
_gitbranch='master'
pkgname='libavl'
pkgver=2.0.3
pkgrel=2
pkgdesc='GNU library working with binary trees'
arch=('i686' 'x86_64')
url="https://git.savannah.gnu.org/git/${_gitrepository}.git"
license=('GNU')
depends=()
makedepends=('git')
provides=('libavl')
source=("git+https://git.savannah.gnu.org/git/${_gitrepository}.git#branch=${_gitbranch}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_gitrepository}"
  CC='cc -fPIC' make programs
  gcc -shared -o libavl.so avl.o bst.o bsts.o pavl.o pbst.o prb.o rb.o rtavl.o rtbst.o rtrb.o slr.o tavl.o tbst.o trb.o
  install -D -m755 libavl.so "${pkgdir}/usr/local/lib/libavl.so"
}
