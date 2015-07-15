# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintained by ivoarch <ivkuzev@gmail.com>
pkgname=ejectsy
pkgver=672c917
pkgrel=3
pkgdesc="A simple and convenient external disk manager for Linux that sits in the tray."
arch=('any')
url="https://github.com/sharat87/ejectsy.git"
license=('MIT')
depends=('pygtk' 'python2')
makedepends=('git')
source=("git+https://github.com/sharat87/ejectsy.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe --always | sed 's|-|.|g'
}

package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages
  cp -r $srcdir/$pkgname $pkgdir/usr/lib/python2.7/site-packages
  mkdir -p $pkgdir/usr/bin
  echo "#!/bin/bash
  python2 /usr/lib/python2.7/site-packages/$pkgname/main.py" > $pkgdir/usr/bin/ejectsy
  chmod +x $pkgdir/usr/bin/ejectsy
}


# vim:set ts=2 sw=2 et:
