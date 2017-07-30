# $Id$
# Maintainer: Erik Stein <erik@classlibrary.net>

# python2-xapian maintainers:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: DonVla <donvla/users.sourceforge/net>
# Contributor: Hervé Cauwelier <herve/oursours/net>

pkgbase=python-xapian
pkgname=('python-xapian')
_realname=xapian-bindings
pkgver=1.4.4
epoch=1
pkgrel=1
pkgdesc="Python 3 bindings for Xapian"
arch=('i686' 'x86_64')
url="http://xapian.org/docs/bindings/python/"
license=('GPL')
makedepends=('python-sphinx' "xapian-core=$epoch:$pkgver")
source=("http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-${pkgver}.tar.xz")
sha512sums=('006e771b3ea654130b4f76f1a1caee576fd5a3fa6317ca44f1e5483671e8c83073ecbde4f3fc7f84c75590eec53acb59701af4cf9bcd72355ed9d53924492b53')

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
