# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Pat Rondon <pmr@@patrondon.org>

pkgname=urlgrabber
pkgver=4.0.0
pkgrel=1
pkgdesc="A high-level cross-protocol url-grabber and Python library"
url="http://urlgrabber.baseurl.org/"
license=('LGPL')
arch=(any)
depends=(python2 python2-pycurl)
source=(http://$pkgname.baseurl.org/download/$pkgname-$pkgver.tar.gz)
sha256sums=('d152d10c7decce45ce5b44f8ee8ee5fd0047217f4152eebb8e0c552ca5137af0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/libexec/lib/' setup.py urlgrabber/grabber.py
  sed -i '1s/python/&2/' scripts/urlgrabber-ext-down
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
