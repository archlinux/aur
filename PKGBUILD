# Maintainer: Yuki Chiba <yuki.from.akita@gmail.com>

pkgname=emacs-fold-dwim
pkgver=1.3
pkgrel=2
pkgdesc='DWIM stands for “DoWhatIMean”, as in the idea that one keystroke can do different things depending on the context.'
arch=('any')
url="http://www.dur.ac.uk/p.j.heslin/Software/Emacs/"
license=('GPL')
groups=()
depends=('emacs')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
source=($url/Download/fold-dwim.el)
md5sums=('c1c835d061e142d55f27c76848fe4891')

elispfile=fold-dwim

build() {
  cd "$srcdir/"
  emacs -q -batch -f batch-byte-compile $elispfile.el
}

package() {
  cd "$srcdir/"
  install -d -m 755 "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 $elispfile.el "$pkgdir"/usr/share/emacs/site-lisp
  install -c -m 644 $elispfile.elc "$pkgdir"/usr/share/emacs/site-lisp
}

# vim:set ts=2 sw=2 et:
