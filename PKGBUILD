# Maintainer: James An <james@jamesan.ca>

pkgname=python2-volatility
_pkgname=${pkgname#python2-}
pkgver=2.6
pkgrel=1
pkgdesc='An advanced memory forensics framework'
arch=('any')
url='http://volatilityfoundation.org'
license=('GPL')
depends=('python2')
source=("https://github.com/volatilityfoundation/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('78234e807fc31394f22117d6c01a8798')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
