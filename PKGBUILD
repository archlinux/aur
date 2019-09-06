# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgsrcname=elpy
_pkgmaintainer=jorgenschaefer
_pkgdestdirname=elpy
_versionprefix=
pkgver=1.30.0
pkgrel=1
pkgdesc="Emacs Python Development Environment"
pkgname=emacs-${_pkgdestdirname}
arch=('any')
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-company-mode' 'emacs-find-file-in-project' 'emacs-highlight-indentation' 'emacs-pyvenv' 'emacs-yasnippet' 'emacs-s' 'python-elpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('8e89bf5eeb8065972b4736d4d8958a71fbee79cbd2316028c19505a9c93a1d9c')
install=${pkgname}.install

package() {
  cd ${_pkgsrcname}-${pkgver}
  mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/snippets/python-mode
  install -m644 *.el "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 snippets/python-mode/* "$pkgdir"/usr/share/emacs/site-lisp/snippets/python-mode/
}
