# $Id: PKGBUILD 105756 2014-02-15 17:50:32Z heftig $
# Maintainer: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Pat Rondon <pmr@@patrondon.org>

pkgname=urlgrabber
pkgver=3.10.1
pkgrel=2
pkgdesc="A high-level cross-protocol url-grabber and Python library"
url="http://urlgrabber.baseurl.org/"
license=('LGPL')
arch=(any)
depends=(python2 python2-pycurl)
source=(http://$pkgname.baseurl.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('1f5dc63805623cc473e06204fd240bb2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/libexec/lib/' setup.py urlgrabber/grabber.py
  sed -i '1s/python/&2/' scripts/urlgrabber-ext-down
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
