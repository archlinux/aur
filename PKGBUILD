# Maintainer: Charles Goyard <cg@fsck.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=bzrtools
pkgver=2.6.0
pkgrel=2
pkgdesc="Useful collection of utilities (all plugins, right now) for bzr."
changelog="$pkgname.changelog"
arch=('any')
url="http://bazaar-vcs.org/BzrTools"
license=('GPL')
depends=('bzr')
source=(http://launchpad.net/$pkgname/stable/$pkgver/+download/$pkgname-$pkgver.tar.gz)
sha256sums=('8b17fbba61dafc8dbefe1917a2ce084a8adc7650dee60add340615270dfb7f58')


package() {
  cd "$srcdir/$pkgname"

  # python 2 fix
  for _file in test.py check-release.py
  do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' ${_file}
  done

  python2 setup.py install --root=$pkgdir
}

