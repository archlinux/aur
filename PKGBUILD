# Contributor : Kyle Keen <keenerd@gmail.com>
# Maintainer : edacval <edacval@gmail.com>

pkgname=python2-isodate
pkgver=0.6.0
pkgrel=3
pkgdesc="An ISO 8601 date/time/duration parser and formatter"
arch=('any')
url="https://github.com/gweis/isodate/"
license=('BSD')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/isodate/isodate-$pkgver.tar.gz")
sha1sums=('2c69e08c9894a9cd96c627146463260f5731df62')


build() {
  cd "$srcdir/isodate-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/isodate-$pkgver"
  python2 setup.py test
}

package() {
  depends=('python2-six')

  cd "$srcdir/isodate-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  head -26 src/isodate/isodates.py > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

