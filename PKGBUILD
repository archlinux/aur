# Maintainer: yantis@yantis.net
# Contributor: Felipe Morales <hel.sheep@gmail.com>

pkgname=python2-gcp
_srcname=gcp
pkgver=0.1.3
pkgrel=1
pkgdesc="gcp is a file copy tool, freely inspired from cp, but with a few high-level functionnality."
arch=("any")
url="http://wiki.goffi.org/wiki/Gcp/en"
license=('GPL3')
depends=('python2' 'python2-gobject' 'python2-dbus')
source=('ftp://ftp.goffi.org/gcp/gcp.tar.bz2')
makedepends=('python2-setuptools')
md5sums=('146da3e5508be6273b0a9169326286f2')

build() {
  cd "$srcdir/$_srcname-$pkgver"
  sed -i -r "s|^#!/usr/bin/env python|#!/usr/bin/env python2|" *.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$_srcname-$pkgver"
  python2 setup.py install --root=/$pkgdir/ --optimize=1
}
