# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pyt-git
pkgver=0.30.r0.g00afcd3
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis (Git version)'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-setuptools')
makedepends=('git')
provides=('pyt')
conflicts=('pyt')
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd pyt
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pyt
  python setup.py build
}

check() {
  cd pyt
  python -m tests
}

package() {
  cd pyt
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
