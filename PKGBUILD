# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-autoimport
pkgver=0.7.3
pkgrel=1
pkgdesc='Autoimport automatically fixes wrong import statements'
arch=('any')
url=https://github.com/lyz-code/autoimport/
license=('GPL')
depends=('python'
         'python-autoflake'
         'python-click'
         'python-pyprojroot'
         'python-sh')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lyz-code/autoimport/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c2917dc07065f0842a691eeec1cfdb83e09ddbf618f5c51c294404eb64a55f06a694d1c279140ccaf09c59dbbbcef6dc5648879aa7f7bce327e197d2c0bf787c')

build() {
  cd "autoimport-$pkgver"
  python setup.py build
}

package() {
  cd "autoimport-$pkgver"
  python setup.py install --optimize=1 --root="$pkgdir" --skip-build
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
