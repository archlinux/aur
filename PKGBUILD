# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>

pkgname=flycheck
pkgver=34.1
pkgrel=1
pkgdesc='Modern on-the-fly syntax checking extension for GNU Emacs'
arch=('any')
url="http://www.flycheck.org/"
license=('GPL')
# groups=('emacs-plugins')
depends=('emacs' 'emacs-dash')
makedepends=('emacs' 'texinfo')
source=("https://github.com/flycheck/flycheck/archive/$pkgver.tar.gz")
sha256sums=('b90c14bbd2cfe7290ba971497aadbd6484fea6148af62b0fe96a03a733226ce1')

build() {
  cd "$pkgname-$pkgver"

  emacs --batch -f batch-byte-compile flycheck.el
  #makeinfo --force --no-split -o doc/flycheck.info doc/flycheck.texi //not needed 
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/emacs/site-lisp/flycheck"
  install -Dm644 flycheck.{el,elc} "$pkgdir/usr/share/emacs/site-lisp/flycheck"
  #install -Dm644 doc/flycheck.info "$pkgdir/usr/share/info/flycheck.info"  //not needed
}
