# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-dbus-introspection
pkgver=0.1
pkgrel=1
pkgdesc="A framework that makes accessing remote D-Bus objects from Emacs Lisp easier"
arch=('any')
url="http://bazaar.launchpad.net/~scymtym/+junk/dbus-proxy/"
license=('GPL')
depends=('emacs')
source=('http://bazaar.launchpad.net/~scymtym/+junk/dbus-proxy/download/scymtym%40gmx.net-20100824014654-ifbwtut1heda3tu7/dbusintrospection.el-20090825015526-rsd6s9n5ebqeuqwm-1/dbus-introspection.el')
md5sums=('cac49e72688a9780efdba750b6dd2122')

build() {
  cd "$srcdir/$_bzrmod"
  emacs -batch -q -f batch-byte-compile dbus-introspection.el
}

package() {
  cd "$srcdir/$_bzrmod"
  install -Dm644 dbus-introspection.el \
    $pkgdir/usr/share/emacs/site-lisp/dbus-introspection.el
  install -Dm644 dbus-introspection.elc \
    $pkgdir/usr/share/emacs/site-lisp/dbus-introspection.elc
}
