# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python2-cmd2
pkgver=0.8.9
pkgrel=1
pkgdesc="A tool for building interactive command line applications in Python"
arch=('any')
url="https://github.com/python-cmd2/cmd2"
license=('MIT')
depends=('python2-pyparsing' 'python2-pyperclip' 'python2-six' 'python2-wcwidth'
         'python2-contextlib2' 'python2-enum34' 'python2-subprocess32')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-pytest-xdist' 'python2-mock' 'vi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-cmd2/cmd2/archive/$pkgver.tar.gz")
sha512sums=('1d88e98ced08760f745a426dbf7031e2f8132484e0be833fb7afbbe0b02a0d5416ef7c852dd816cba0329d10356714cfc73fb303bdc885e982223b717d4508cc')

build() {
  cd cmd2-$pkgver
  python2 setup.py build
}

check() {
  cd cmd2-$pkgver
  python2 setup.py pytest
}

package() {
  cd cmd2-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
