# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=emacs-langtool
pkgver=1.2.3
pkgrel=1
pkgdesc="LanguageTool for Emacs"
arch=('any')
url="https://github.com/mhayashi1120/Emacs-langtool"
license=('GPL')
depends=('emacs' 'languagetool')
options=(!emptydirs)

source=("https://github.com/mhayashi1120/Emacs-langtool/archive/$pkgver.tar.gz" "languagetool.patch")
md5sums=('c59b2a50f705b879922a32e3630cd735'
         'cf5b407289b3f72b0eb8f1784d4d93f6')

build() {
  cd "$srcdir"/Emacs-langtool-$pkgver

  patch -p0 < ../languagetool.patch
}

package() {
  cd "$srcdir"/Emacs-langtool-$pkgver
  install -D -m644 langtool.el "${pkgdir}/usr/share/emacs/site-lisp/langtool.el"
}

