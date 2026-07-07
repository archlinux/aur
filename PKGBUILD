# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-clx-xembed-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#cl-}
pkgver=0.1.r10.ga5c4b84
pkgrel=1
pkgdesc='An implementation of the XEMBED protocol that integrates with CLX'
arch=('any')
url="https://github.com/laynor/clx-xembed"
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-clx')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package(){
  cd "$_pkgname"
  install -d "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  cp -r *.{lisp,asd} test utils "$pkgdir/usr/share/common-lisp/source/$_pkgname"
}
