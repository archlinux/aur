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
sha256sums=('04fb0f610ec19a1aad1698d20829fb8caa34a97fe9cd4d9acf9f4f9f918d79b0')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # python2 fix
  find . -name '*.py' -exec \
    sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_;s_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' '{}' \;

  python2 setup.py install --prefix=${pkgdir}/usr --optimize=1
}
