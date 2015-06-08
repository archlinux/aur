# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-dbus-proxy
pkgver=0.3
pkgrel=1
pkgdesc="A framework that makes accessing remote D-Bus objects from Emacs Lisp easier"
arch=('any')
url="http://bazaar.launchpad.net/~scymtym/+junk/dbus-proxy/files"
source=('http://bazaar.launchpad.net/~scymtym/+junk/dbus-proxy/download/scymtym%40gmx.net-20101004012131-n7iv2ag33hlqc42p/dbusproxy.el-20090825015526-rsd6s9n5ebqeuqwm-2/dbus-proxy.el')
md5sums=('9e67e25d79800c2e713b3fe233ce1ac2')
license=('GPL')
depends=('emacs-dbus-introspection')
 
build() {
  cd "$srcdir/"
  emacs -batch -q -f batch-byte-compile dbus-proxy.el
}

package() {
  cd "$srcdir/"
  install -Dm644 dbus-proxy.el \
    $pkgdir/usr/share/emacs/site-lisp/dbus-proxy.el
  install -Dm644 dbus-proxy.elc \
    $pkgdir/usr/share/emacs/site-lisp/dbus-proxy.elc
}
