# Maintainer:
# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

_name=werkzeug
pkgname=python2-$_name
pkgver=1.0.1
pkgrel=2
pkgdesc='Swiss Army knife of Python web development'
url='http://werkzeug.pocoo.org/'
arch=('any')
license=('custom:BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/$_name/archive/$pkgver.tar.gz")
b2sums=('d2dcdce8b1bcbb177b52b0915f2c0ac17d235dee3c77b23e81e4b35412d1f53a194d3c7c7f2a5c065ade99797effe72cc464cf6980b12c761a8a919338021660')

build() {
  cd "$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
