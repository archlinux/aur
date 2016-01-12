# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sunrise-commander
pkgver=6r463
pkgrel=2
pkgdesc="A two panel filemanager for emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Sunrise_Commander"
license=('GPL')
depends=('emacs' 'avfs' 'fuse')
optdepends=('zip: support for zip files' 'unzip: support for zip files')
source=(http://www.emacswiki.org/emacs/download/sunrise-commander.el)
md5sums=('d41d8cd98f00b204e9800998ecf8427e')

prepare() {
  printf "%s" $(awk '/RCS/ {print $5}' $pkgname.el)
}

package() {
  install -Dm644 $pkgname.el \
    $pkgdir/usr/share/emacs/site-lisp/$pkgname.el
}
