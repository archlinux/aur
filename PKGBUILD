# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <aaron.l.france@gmail.com>
pkgname=lxc-wrapper
pkgver=1
pkgrel=1
epoch=
pkgdesc="An opinionated LXC wrapper"
arch=('i686' 'x86_64')
url="https://github.com/Ralt/lxc-wrapper.git"
license=('MIT')
groups=()
depends=('sbcl')
provides=('lxc-wrapper')
source=(git://github.com/Ralt/lxc-wrapper.git)
md5sums=('SKIP')


build() {
  cd lxc-wrapper
  sed -i 's/--compress/--asdf-tree . --compress/g' Makefile
  ASDF_TREE=~/.quicklisp/ make
}

package() {
  cd lxc-wrapper
  mkdir -p $pkgdir/usr/bin/
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
