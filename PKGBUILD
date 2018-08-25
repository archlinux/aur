# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-jedi
pkgver=0.2.7
pkgrel=4
pkgdesc="Python auto-completion for Emacs"
url="https://github.com/tkf/emacs-jedi"
arch=('any')
license=('GPL3')
depends=('emacs' 'python-jedi' 'emacs-auto-complete' 'emacs-epc' 'emacs-python-environment' 'python-virtualenv')
makedepends=('git')
provides=('emacs-jedi')
source=("$pkgname-$pkgver.zip::https://github.com/tkf/emacs-jedi/archive/master.zip")
sha256sums=('SKIP')

build() {
  cd emacs-jedi-master
  emacs -q --no-splash -batch -L . -f batch-byte-compile jedi*.el
}

package() {
  cd emacs-jedi-master
  install -d "$pkgdir"/usr/share/emacs/site-lisp/jedi
  install -m644 jedi*.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/jedi/
  install -m755 jedi*.py "$pkgdir"/usr/share/emacs/site-lisp/jedi/
}
