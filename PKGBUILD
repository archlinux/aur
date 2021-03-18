# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>

pkgname=evince-synctex
_pkgname=${pkgname/-/_}
pkgver=1
pkgrel=2
pkgdesc="Several scripts to ease the use of Evince with SyncTeX"
arch=('any')
url="http://forum.ubuntuusers.de/topic/evince-synctex-vim-emacs-scite-lyx-kile-editor/"
license=('GPL')
depends=('dbus-glib' 'dbus-python' 'python-gobject')
install=$pkgname.install
source=(http://dud.inf.tu-dresden.de/~ben/${_pkgname}.tar.gz
        $pkgname.patch)
sha256sums=('65b43f00e894d116bbccf62cac1d6bdd753c6bcb4d0d7f90efbf10c59dc95052'
            'b17ee71aa63c49f870e1db18d67b75a3ed704ddbf494b8fe41316bc6e8c83457')

prepare() {
  cd "$srcdir/${_pkgname}"

  patch -p1 < ../$pkgname.patch
}

package() {
  cd "$srcdir/${_pkgname}"

  install -D evince "$pkgdir/usr/bin/$pkgname"
  install evince_backward_search \
          evince_forward_search \
          "$pkgdir/usr/bin"
}
