# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Stanisław Pitucha <viraptor@gmail.com>

pkgname=python-ofxparse
pkgver=0.20
pkgrel=1
pkgdesc="Tools for working with the OFX (Open Financial Exchange) file format"
arch=('any')
url="http://sites.google.com/site/ofxparse"
license=('MIT')
depends=('python-beautifulsoup4' 'python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jseutter/ofxparse/archive/$pkgver.tar.gz")
sha256sums=('ec97c7289ded55d4aa1a8aaea71cb50d5998e311b43958dbbeb4a2db78a1ca58')

build() {
  cd "$srcdir/ofxparse-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/ofxparse-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
