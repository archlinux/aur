# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus-mode
pkgver=2017.02.26
pkgrel=1
pkgdesc="Bookmark+ mode, which enhances vanilla Emacs bookmarks in many ways"
url="http://www.emacswiki.org/emacs/BookmarkPlus"
license=('GPL3')
arch=('any')
depends=('emacs')
makedepends=('awk')
install=emacs-bookmarkplus-mode.install
source=("http://www.emacswiki.org/emacs/download/bookmark+.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-mac.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-bmu.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-1.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-key.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-lit.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-doc.el"
        "http://www.emacswiki.org/emacs/download/bookmark+-chg.el")
md5sums=('4f2f6e6ce4a13c6e5e3f01e093f41413'
         '8734bc137b5ab36669c4140bcd5857e6'
         '7bc973ca676c98aef6fed52d0ec4ffbe'
         'aa758c00bd19f69df6e5899e6592d365'
         'a54a19d4db3a5d7d06dc4771fe2c445d'
         '6c362bab1db9c26726b0e490f8fb4ec8'
         'a2955e140b0a29dd0a837a3adc900cf8'
         '57a9fc82e6114b9a3b3c3776a04da41b')

pkgver() {
  cd $srcdir
  awk '/Version/ {print $3}' bookmark+.el
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp/"
  install -Dm644 *.el "${pkgdir}/usr/share/emacs/site-lisp/"
}
