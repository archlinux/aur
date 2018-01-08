# $Id$
# Maintainer: Erik Stein <erik@classlibrary.net>

# python2-xapian maintainers:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: DonVla <donvla/users.sourceforge/net>
# Contributor: Hervé Cauwelier <herve/oursours/net>

pkgbase=python-xapian
pkgname=('python-xapian')
_realname=xapian-bindings
pkgver=1.4.5
epoch=1
pkgrel=1
pkgdesc="Python 3 bindings for Xapian"
arch=('x86_64')
url="http://xapian.org/docs/bindings/python/"
license=('GPL')
makedepends=('python-sphinx' "xapian-core=$epoch:$pkgver")
source=("http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-${pkgver}.tar.xz")
sha512sums=('e39ece495e25077990db3d06554306567c52c6f45ad55a65005cb97e18086ee18947e41d0d612157b891b61e015881385bcb082a03aa0c6452565e90d09e8275')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config \
    --prefix=/usr --with-python3 \
    PYTHON=/usr/bin/python3
  make
}

package_python-xapian() {
  depends=('python' "xapian-core=$epoch:$pkgver")

  cd ${_realname}-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
