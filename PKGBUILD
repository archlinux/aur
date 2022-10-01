# Maintainer: Gregory Land <landjgregory at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=python-nanotime
pkgver=0.5.2
pkgrel=1
pkgdesc="Provides a Python time object that keeps time as the number of nanoseconds since the UNIX epoch."
arch=('any')
license=('MIT')
url="https://github.com/jbenet/nanotime"
source=("git+$url#commit=a60cbd2272b2dd36517445312e55ef44814d69e4")
depends=('python')
makedepends=('git' 'python-setuptools')
sha256sums=('SKIP')

build() {
  cd ${pkgname#python-}/python
  python setup.py build
}

package() {
  cd ${pkgname#python-}/python
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
