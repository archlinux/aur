# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=emacs-ansible
_pkgmaintainer=k1LoW
_pkgdestdirname=ansible
_versionprefix=
pkgver=0.1.0
pkgrel=2
pkgdesc="Ansible minor mode for Emacs"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs' 'emacs-s' 'emacs-f' 'emacs-yasnippet')
source=("https://github.com/k1LoW/emacs-ansible/archive/master.zip")
sha256sums=('f6a53e781277696104f23ed304b318c38fd17a6d9a254e4c592ad178eb17a8eb')
install=${pkgname}.install

build() {
  cd "${srcdir}/${_pkgsrcname}-master"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-master"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
