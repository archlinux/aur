# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
name=hvac
pkgver=0.10.6
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$name-$pkgver.tar.gz::https://github.com/hvac/$name/archive/v$pkgver.tar.gz")
sha512sums=('d29704234c13fdf89608b6b7681bb33c9cc7e685576dfe7810b4679b43c3cc70de7b265d3685eeb7a2f8c523617bd9098d36d2c4a9f5210e80f540f5ed1602a7')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
