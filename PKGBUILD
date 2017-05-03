# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=pcap-mode
_pkgmaintainer=orgcandman
_pkgdestdirname=pcap-mode
_versionprefix=
pkgver=0.2
pkgrel=1
pkgdesc="Emacs lisp pcap file viewer"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL2')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/master.zip")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgsrcname}-master"
  emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "${srcdir}/${_pkgsrcname}-master"
  mkdir -p "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
  install -m644 *.el{c,} "${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"
}
