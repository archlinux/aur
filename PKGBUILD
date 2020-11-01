# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2cli
pkgver=2020.11.0.dev0
pkgrel=1
pkgdesc="Command line interface for QIIME 2"
arch=('any')
url="https://qiime2.org"
license=('BSD')
depends=('python-qiime2' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/q2cli/archive/${pkgver}.tar.gz")
sha256sums=('51c66a26ea8f41f617ef4c33dc6651ba327bf83a97deda23bc5d6368cee5bb81')

build() {
  cd "q2cli-$pkgver"
  python setup.py build
}

package(){
  cd "q2cli-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
