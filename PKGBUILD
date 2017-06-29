# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=kaa-base
pkgver=0.6.0
pkgrel=5
pkgdesc="KAA base package"
url="http://freevo.sourceforge.net/"
license=('GPL2')
depends=('python2' 'glib2')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/freevo/$pkgname-$pkgver.tar.gz)
md5sums=('5fdac0492dbbb412c2cafe32ea8c60a8')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --prefix=${pkgdir}/usr --optimize=1
}
