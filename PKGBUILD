# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-ioflo
pkgver=2.0.0
pkgrel=1
pkgdesc='Flo based programming interface in python'
arch=('any')
url='https://ioflo.com'
license=('Apache')
depends=('python')
makedepends=('python-setuptools-git')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz")
sha512sums=('b4b70aef65cffe067d7563682a2cbeac0a07cd4722aa2de8fb56fd127c99df771dc5d3d22be24aadd628a26fd1b7407db684ea7257b45eba8f8376f4ad226a87')

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
