# Contributor: karnath <karnathtorjian@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_base=yasnippets-latex
pkgname=emacs-${_base/s-l/-l}-git
pkgver=2014_02_18
pkgrel=1
pkgdesc="LaTeX snippets for emacs yasnippets"
arch=(any)
url="https://github.com/madsdk/${_base}"
license=(GPL3)
depends=(emacs-yasnippet auctex)
makedepends=(git)
conflicts=(emacs-yasnippet-latex emacs-yasnippet-latex-git)
provides=(emacs-yasnippet-latex emacs-yasnippet-latex-git)
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  echo $(git log -1 --format="%cd" --date=short | sed 's+-+_+g')
}

package() {
  cd ${_base}
  install -d "$pkgdir"/usr/share/emacs/site-lisp/yas/snippets/latex-mode
  ./install.sh "$pkgdir"/usr/share/emacs/site-lisp/yas
}
