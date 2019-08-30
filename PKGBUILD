# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-ht-git
pkgver=2.2.r16.ga5a046e
pkgrel=1
pkgdesc="The missing Emacs hash table library."
arch=('any')
url="https://github.com/Wilfred/ht.el"
license=('GPL3')
depends=('emacs-dash')
makedepends=('cask' 'git')
conflicts=('emacs-ht')
provides=('emacs-ht')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "ht.el"
  git describe --tags | sed 's+-+.r+'| tr - .
}

package() {
  cd ht.el
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 *.el "$pkgdir"/usr/share/emacs/site-lisp/
}
