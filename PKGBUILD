# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
name=hvac
pkgver=0.10.11
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$name-$pkgver.tar.gz::https://github.com/$name/$name/archive/v$pkgver.tar.gz")
sha512sums=('6b68bd19d5621758637ec257992e03da6b1746e5ac1d1b8d63098b6c0c1dc0c0f92fb6bd653b5458e8c55060a48619eb4d09ec4d0529cc2b3f4b91745bd2095c')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
