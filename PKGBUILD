# Maintainer: David Vilar Benet <archlinux at b0rken dot de>

pkgname=python-hvac
name=hvac
pkgver=0.10.9
pkgrel=1
pkgdesc="Python 2.7/3.X client for HashiCorp Vault"
url="https://python-hvac.org/"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$name-$pkgver.tar.gz::https://github.com/$name/$name/archive/v$pkgver.tar.gz")
sha512sums=('4af23583110ca4c2c9714f5234daf21ee199c2ac97cde01a220db6f5d89957b95c1e8b84904104e5a96ec39b54cea567973427a73ed7cae5806e794d37403a8d')

build() {
  cd "$srcdir/$name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$name-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
}
