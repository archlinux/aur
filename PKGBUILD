# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-xmlspam-git
_pkgname=${pkgname%-git}
pkgver=r2.ea06abc
pkgrel=1
pkgdesc='Concise, regexp-like pattern matching on streaming XML with Common Lisp'
arch=('any')
url='https://github.com/rogpeppe/cl-xmlspam'
license=('BSD')
depends=('common-lisp' 'cl-asdf' 'cl-ppcre' 'cl-cxml')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" *.{lisp,asd,txt,xml}
}
