pkgname=emacs-vala-mode
pkgver=0.1
pkgrel=3
pkgdesc="A major mode for editing Vala source files in Emacs"
arch=('any')
url="https://live.gnome.org/Vala/Emacs"
license=('GPL')
depends=('emacs')
install=emacs-vala-mode.install
source=("vala-mode.el::https://live.gnome.org/Vala/Emacs?action=AttachFile&do=get&target=vala-mode.el")
sha512sums=('93fa92f606d631fee1185430fecc6d54794ccafffdab305a8bf7c73f598e421d9a563d3e297fff0edcce624eae5ccecf4d5c0d138288a2839c9c7f8e27e47c4b')

build() {
  emacs -batch -f batch-byte-compile vala-mode.el
}

package() {
  install -Dm 444 *.el* -t "$pkgdir/usr/share/emacs/site-lisp"
}
