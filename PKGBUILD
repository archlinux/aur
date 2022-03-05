# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=python2-imagesize
pkgver=1.3.0
pkgrel=1

pkgdesc='Getting image size from png/jpeg/jpeg2000/gif file'
url='https://github.com/shibukawa/imagesize_py'
arch=('any')
license=('MIT')

depends=('python2')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/i/imagesize/imagesize-$pkgver.tar.gz")

sha256sums=('cd1750d452385ca327479d45b64d9c7729ecf0b3969a58148298c77092261f9d')

build() {
  cd "$srcdir"/imagesize-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/imagesize-$pkgver
  python2 -m unittest discover -v
}

package() {
  cd imagesize-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
