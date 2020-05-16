# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: David Baum <david.baum@naraesk.eu>

pkgname=python-phue
_module='phue'
pkgver=1.1
pkgrel=1
pkgdesc="A Python library for the Philips Hue system"
arch=('any')
url="https://github.com/studioimaginaire/phue"
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://github.com/studioimaginaire/phue/archive/${pkgver}.tar.gz")
md5sums=('2c3303552b4f762d780deda26aedc507')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
  depends+=()
  cd "${srcdir}/${_module}-${pkgver}"
  install -Dm644 $srcdir/${_module}-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
