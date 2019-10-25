# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-ioflo
pkgver=1.7.6
pkgrel=2
pkgdesc='Flo based programming interface in python'
arch=('any')
url='https://ioflo.com'
license=('Apache')
depends=('python')
makedepends=('python-setuptools-git')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz")
sha512sums=('ce3e400249c530c55dee8ac4bacd7baf6edbba0be918251266a2c03ecbb30dbec38535097925cf949fa21b1c4e37499726f9bcca784109979f90cec086c94899')

build() {
  cd ioflo-$pkgver
  python setup.py build
}

check() {
  cd ioflo-$pkgver
  python setup.py pytest
}

package() {
  cd ioflo-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
