# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Victor van den Elzen <victor.vde@gmail.com>

pkgname=emacs-color-theme-solarized
pkgver=1.0.0.beta2
pkgrel=2
pkgdesc="Solarized color theme for Emacs"
arch=('any')
url="http://ethanschoonover.com/solarized"
license=('MIT')
depends=('emacs-color-theme')
makedepends=('git')
source=("git+https://github.com/sellout/$pkgname#commit=f3ca8902ea056fb8e46cb09f09c96294e31cd4ee")
md5sums=('SKIP')
install=solarized.install

build() {
  cd $pkgname
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  cd $pkgname
  install -Dm644 *{.el,.elc} -t "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/emacs-color-theme-solarized/
}

