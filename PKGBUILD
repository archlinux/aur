# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-puri-git
__pkgname=${pkgname%-git}
_pkgname=${__pkgname#cl-}
pkgver=r57.4bbab89
pkgrel=1
pkgdesc='Portable universal resource indentifier library for common lisp'
arch=('any')
url='http://puri.kpe.io/'
license=('custom:LLGPL')
depends=('common-lisp' 'cl-asdf')
makedepends=('git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=('git+https://gitlab.common-lisp.net/clpm/puri')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README
  install -Dm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" *.{lisp,asd}
}
