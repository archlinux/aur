# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Stanisław Pitucha <viraptor@gmail.com>

_pkgname=ofxparse
pkgname=python-$_pkgname
pkgver=0.21
pkgrel=2
pkgdesc="Tools for working with the OFX (Open Financial Exchange) file format"
arch=('any')
url="http://sites.google.com/site/ofxparse"
license=('MIT')
depends=('python-beautifulsoup4' 'python-six')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jseutter/ofxparse/archive/$pkgver.tar.gz")
sha256sums=('2c61c5ab65b432c548823de656167ba738c937565206e0768f4c437e850f4821')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
