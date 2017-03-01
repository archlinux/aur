# Contributor: Marco Pompili <aur@emarcs.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com>
# Contributor: Nick Vogel <vogelrn+aur@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-clojure-mode
pkgver=5.4.0
pkgrel=2
arch=('any')
pkgdesc="Emacs major mode for the clojure language"
url="https://github.com/clojure-emacs/clojure-mode"
license=("GPL3")
depends=('emacs')
optdepends=('paredit: enhanced LISP structure editing')
install='emacs-clojure-mode.install'
source=("emacs-clojure-mode.tar.gz::https://github.com/clojure-emacs/clojure-mode/archive/${pkgver}.tar.gz")
sha256sums=('013dccfb444ca1855e481e81f969a343bc362b267ed7caebaea85a02b1dcf584')

build() {
  cd clojure-mode-${pkgver}
  CASK=./Cask make
}

package() {
  cd clojure-mode-${pkgver}
  install -d "${pkgdir}/usr/share/emacs/site-lisp/"

  # install the files in directory created above
  install -m644 clojure-mode.el{,c} -t "${pkgdir}/usr/share/emacs/site-lisp/"
  install -m644 clojure-mode-extra-font-locking.el -t "${pkgdir}/usr/share/emacs/site-lisp/"
}
