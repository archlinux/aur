# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Pat Rondon <pmr@@patrondon.org>

pkgname=urlgrabber
pkgver=4.1.0
_pkgver="4-1-0"
pkgrel=1
pkgdesc="A high-level cross-protocol url-grabber and Python library"
url="https://github.com/rpm-software-management/urlgrabber"
# Old versions were at http://urlgrabber.baseurl.org/
license=('LGPL')
arch=(any)
depends=('python2' 'python2-pycurl' 'python2-six')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rpm-software-management/$pkgname/archive/$pkgname-$_pkgver.tar.gz")
sha256sums=('15d95a67be991cc0722d45f6c7902bfce06f298b1edcb3faba4ccc1865992342')

package() {
  cd "$srcdir/$pkgname-$pkgname-$_pkgver"
  sed -i 's/libexec/lib/' setup.py urlgrabber/grabber.py
  sed -i '1s/python/&2/' scripts/urlgrabber-ext-down
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
