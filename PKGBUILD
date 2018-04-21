# Contributor: Renato Garcia <fgarcia.renato@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-bookmarkplus-mode
pkgver=2017.03.31
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
md5sums=('649ecbd6a757b52591f79502c0ff2ee2'
         '3f5454fb622fa72d7ac966332cb455d3'
         '9ef4349577df93d171cc40d117d9d30c'
         'de968d00e40c1cc997ed6b88475a4975'
         '87a7714bbfa2a8af221a47a403e14010'
         '38f2c1678ac262fc9aad36d1d98d97d2'
         '59c1b44697821f6e2d0bfeec63582a28'
         '761697dd9fd3d1015c46a2a4cb48d226')

pkgver() {
  cd $srcdir
  awk '/Version/ {print $3}' bookmark+.el
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/emacs/site-lisp/"
  install -Dm644 *.el "${pkgdir}/usr/share/emacs/site-lisp/"
}
