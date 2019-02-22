pkgname=sph-scheme-mode-git
pkgver=0.3
pkgrel=3
pkgdesc='emacs major mode for standard scheme editing'
arch=(any)
license=(gpl3)
depends=(emacs)
url=http://sph.mn
source=(https://raw.githubusercontent.com/sph-mn/sph-other/master/emacs/mode/sph-scheme-mode.el)
md5sums=(21b3640ee3cb68190dd652c145a5f99c)

build() {
  emacs -q -no-site-file -batch -f batch-byte-compile sph-scheme-mode.el
}

package() {
  name=sph-scheme-mode
  prefix="$pkgdir/usr/share/emacs/site-lisp"
  install -D -m644 $name.elc "$prefix/$name.elc"
  install -D -m644 $name.el "$prefix/$name.el"
}