pkgname=emacs-vala-mode
pkgver=0.1
pkgrel=2
pkgdesc="A major mode for editing Vala source files in Emacs"
arch=('any')
url="https://live.gnome.org/Vala/Emacs"
license=('GPL')
depends=('emacs')
install=emacs-vala-mode.install
source=("https://live.gnome.org/Vala/Emacs?action=AttachFile&do=get&target=vala-mode.el")
sha256sums=('b6b90fcdf0ba1f0cd98e6002a7186a900e03593186869a82d11aa0d78f93d76a')

build() {
  cd "$srcdir"

  mv Emacs\?action\=AttachFile\&do\=get\&target\=vala-mode.el vala-mode.el

  emacs -batch -f batch-byte-compile vala-mode.el
}

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/emacs/site-lisp
  cp $srcdir/*.el* $pkgdir/usr/share/emacs/site-lisp
}
