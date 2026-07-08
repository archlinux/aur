# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-iolib
_pkgname=${pkgname#cl-}
pkgver=0.8.4
pkgrel=1
pkgdesc='Common Lisp I/O library'
arch=('any')
url='https://github.com/sionescu/iolib'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'libfixposix' 'cl-cffi'
         'cl-bordeaux-threads' 'cl-idna' 'cl-swap-bytes')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41612f787153181cd8dd3781ab5207aad42ec4dbf369cd03847f5098155edb79')

package(){
  cd "$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGES
  install -d "$pkgdir/usr/share/common-lisp/source/$_pkgname"
  cp -r *.asd examples extras src tests version.sexp "$pkgdir/usr/share/common-lisp/source/$_pkgname"
}
