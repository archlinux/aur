# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sunrise-commander
pkgver=6r463
pkgrel=3
pkgdesc="A two panel filemanager for emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Sunrise_Commander"
license=('GPL')
depends=('emacs' 'avfs')
optdepends=('zip: support for zip files' 'unzip: support for zip files')
source=(http://www.emacswiki.org/emacs/download/sunrise-commander.el)
sha256sums=('7ee7d967c4efad398a412c938f76d7ccc80dddaed83294fa788565cd6cd1bd46')

prepare() {
  printf "%s" $(awk '/RCS/ {print $5}' $pkgname.el)
}

package() {
  install -Dm644 $pkgname.el \
    $pkgdir/usr/share/emacs/site-lisp/$pkgname.el
}
