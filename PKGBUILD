# $Id$
# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Mark Rosenstand <mark@archlinux.org
# Contributor: Corrado Primier <cp663137@stud.polimi.it>

pkgname=python2-pymad
pkgver=0.9
pkgrel=1
pkgdesc='Python interface to libmad'
arch=('x86_64' 'i686')
url='https://github.com/jaqx0r/pymad'
license=('LGPL')
depends=('libmad' 'python2')
makedepends=('git')
replaces=('pymad')
conflicts=('pymad')
provides=('pymad')
source=("$pkgname::git+https://github.com/jaqx0r/pymad.git#tag=version/$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  python2 config_unix.py --prefix=/usr
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
