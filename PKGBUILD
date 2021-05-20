# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
name=hvac
pkgver=0.10.12
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$name-$pkgver.tar.gz::https://github.com/$name/$name/archive/v$pkgver.tar.gz")
sha512sums=('a52791bee2eedf488fabb488971f84f357e94812b14de36b45360690d3d018c9162dba9b8a54a719f1fe45b5f526fb729c08c8ece4f3c093f8a8f50a37731260')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
