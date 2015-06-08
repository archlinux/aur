# Contributor: karnath <karnathtorjian@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-yasnippet-latex-git
pkgver=2014_02_18
pkgrel=1
pkgdesc="LaTeX snippets for emacs yasnippets"
arch=('any')
url="https://github.com/madsdk/yasnippets-latex/"
license=('GPLv3')
depends=('emacs-yasnippet' 'auctex')
makedepends=('git')
conflicts=('emacs-yasnippet-latex' 'emacs-yasnippet-latex-git')
provides=('emacs-yasnippet-latex' 'emacs-yasnippet-latex-git')
source=('git://github.com/madsdk/yasnippets-latex.git')
md5sums=('SKIP')
_gitname="yasnippets-latex"

pkgver() {
  cd "$srcdir"/$_gitname
  echo $(git log -1 --format="%cd" --date=short | sed 's+-+_+g')
}

package(){
  cd ${srcdir}/$_gitname 
  install -d  ${pkgdir}/usr/share/emacs/site-lisp/yas/snippets/latex-mode
  ./install.sh  ${pkgdir}/usr/share/emacs/site-lisp/yas
}

