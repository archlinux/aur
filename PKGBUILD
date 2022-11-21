# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python38-isodate
pkgname=('python38-isodate')
pkgver=0.6.1
pkgrel=2
pkgdesc="An ISO 8601 date/time/duration parser and formatter"
arch=('any')
url="https://github.com/gweis/isodate/"
license=('BSD')
depends=('python38-six')
makedepends=('python38-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/isodate/isodate-$pkgver.tar.gz")
sha1sums=('ea36ce1c780dd44f01225dca7f9995a6685a60cc')
sha256sums=('48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c127bde9')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  python3.8 setup.py build
}

check() {
  cd "$srcdir/$pkgbase-$pkgver"
  python3.8 setup.py test
}

package_python38-isodate() {
  cd "$srcdir/$pkgbase-$pkgver"
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  head -26 src/isodate/isodates.py > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}