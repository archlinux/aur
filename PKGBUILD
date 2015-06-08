# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-xlicense
pkgver=2014_07_08
pkgrel=1
pkgdesc="eXtra License mode for Emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/ExtraLicense"
license=('GPL3')
depends=('licenses')
source=("git+https://github.com/stefanhusmann/arch-xlicense")
md5sums=('SKIP')
install=emacs-xlicense.install
_gitname=arch-xlicense

pkgver () {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr - _ 
} 

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 xlicense.el \
  	  "$pkgdir/usr/share/emacs/site-lisp/xlicense.el"
  ln -s /usr/share/licenses/common "$pkgdir/usr/share/emacs/site-lisp/licenses" 
}
