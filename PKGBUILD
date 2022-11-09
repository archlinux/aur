# Maintainer: louson - Louis Rannou

pkgname=emacs-meson-mode-git
pkgver=0.3.r9.g82220d1
pkgrel=1
pkgdesc='Emacs meson-mode'
arch=('any')
url='https://github.com/wentasah/meson-mode'
license=('GPL3')
makedepends=('git')
depends=('emacs')
install="${pkgname}.install"
provides=('emacs-meson-mode')
conflicts=('emacs-meson-mode')
source=("$pkgname"::"git+https://github.com/wentasah/meson-mode.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/meson-mode
  install -Dm644 *.el $pkgdir/usr/share/emacs/site-lisp/meson-mode
}
