# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
name=hvac
pkgver=0.10.14
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$name-$pkgver.tar.gz::https://github.com/$name/$name/archive/v$pkgver.tar.gz")
sha512sums=('3b3b5c64df5c57679a35e09cd61d29090c950dfaa11f64b4c3f8442a3ccf6512cc2d792f60e035815e4c4857813ba49612e0f52c5da3670bd692116a6bd28469')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
