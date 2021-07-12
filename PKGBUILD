# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-pyaml
pkgver=20.4.0
pkgrel=1
pkgdesc="PyYAML-based module to produce pretty and readable YAML-serialized data"
url="https://pypi.python.org/pypi/pyaml"
license=('BSD')
arch=('any')
depends=('python2-yaml')
makedepends=('python2-setuptools')
# checkdepends=('python2-unidecode')
optdepends=('python2-unidecode: Needed if same-id objects or recursion is used within serialized data')
source=("https://files.pythonhosted.org/packages/source/p/pyaml/pyaml-$pkgver.tar.gz")
sha512sums=('432fd215e034beafc07270a6aa8b726d5a16ef8946a95c1db9a34b4f492bbe2089dffbb1ce856d3e8153ec18ac943973a23e3aa9283d53ee0b2e7ba5dcd3d317')

build() {
  cd "$srcdir"/pyaml-$pkgver
  python2 setup.py build
}

## Deprecated and doesn't actually return any meaningful test results
# check() {
#   cd "$srcdir"/pyaml-$pkgver
#   python2 setup.py test
# }

package() {
  cd pyaml-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

