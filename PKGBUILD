# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=emacs-oz-mode
pkgver=20150609
pkgrel=1
pkgdesc="Major mode for editing Mozart/Oz."
arch=('any')
url="https://github.com/mozart/mozart2"
license=('MIT')
depends=('emacs')
install=$pkgname.install
source=(
  "https://raw.github.com/mozart/mozart2/master/opi/emacs/mozart.el"
  "https://raw.github.com/mozart/mozart2/master/opi/emacs/oz.el"
  "https://raw.github.com/mozart/mozart2/master/opi/emacs/oz-extra.el"
  "https://raw.github.com/mozart/mozart2/master/opi/emacs/oz-server.el"
)
md5sums=('d1d1b4b1e55c06c265bfef27e51dc54c'
         '3c7ef9f4280234e9a3b35ff05f38c33c'
         '5b4a5acd817b21e9aa85d439ee14401f'
         'c175f79fb1251d65f4fb583f4625ffff')

build() {
  cd $srcdir
  emacs -batch -f batch-byte-compile $srcdir/*.el
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/oz
  install -Dm644 *.el *.elc $pkgdir/usr/share/emacs/site-lisp/oz
}
