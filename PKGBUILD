# Maintainer: Fabian Brosda <fabi3141@gmx.de>

pkgname=cl-asdf-flv
_pkgname=${pkgname#cl-}
pkgver=2.1
pkgrel=2
pkgdesc="Extension to ASDF to provide file-local variables."
arch=('any')
url="https://www.lrde.epita.fr/~didier/software/lisp/misc.php#asdf-flv"
license=('custom:FSFAP')
depends=('common-lisp' 'cl-asdf')
source=('https://github.com/didierverna/asdf-flv/archive/version-2.1.tar.gz')
sha1sums=('081d1e115ee4214453fb62b992c8024b7d830fde')

package() {
  cd ${_pkgname}-version-${pkgver}

  install -d "$pkgdir"/usr/share/common-lisp/source/${_pkgname}
  install -d "$pkgdir"/usr/share/common-lisp/systems
  
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname}/ ${srcdir}/${_pkgname}-version-${pkgver}/*.lisp
  install -m 644 -t "$pkgdir"/usr/share/common-lisp/source/${_pkgname} ${srcdir}/${_pkgname}-version-${pkgver}/*.asd

  cd "$pkgdir"/usr/share/common-lisp/systems
  ln -s ../source/${_pkgname}/*${_pkgname}.asd .
}
