# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
name=hvac
pkgver=0.10.7
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$name-$pkgver.tar.gz::https://github.com/$name/$name/archive/v$pkgver.tar.gz")
sha512sums=('355346d058b6afc0ebfb04752bbec7fd16b206b71638497e557b7d0a35ff8f3b73a1cca15647b949be9b850e25bc0fddf50f67cfeda05898e0d0ec7ed1f738a6')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
