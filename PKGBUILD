# $Id$
# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>
# Contributor: Bernhard Walle <bernhard@bwalle.de>

# reminder: scons moving to py3 any time soon

pkgname=python2-scons
_pkgname=scons
pkgver=3.0.0
pkgrel=1
pkgdesc="Extensible Python-based build utility"
arch=('any')
url="http://scons.org"
license=('MIT')
depends=('python2')
conflicts=('scons')
provides=('scons')
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('1c99878d0eaf9b768b50721e913142d3')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python2 setup.py install --standard-lib \
                          --prefix=/usr \
                          --install-data=/usr/share \
                          --optimize=1 \
                          --root="$pkgdir"

  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  sed -i 's#/usr/bin/env python#/usr/bin/env python2#' "$pkgdir/usr/bin/scons"
}

# vim:set ts=2 sw=2 et:
