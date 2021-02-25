# Maintainer: piernov <piernov@piernov.org>

pkgname=python-iopath
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightweight I/O abstraction providing a common interface across storage backends"
arch=('any')
url="https://github.com/facebookresearch/iopath"
license=('MIT')
depends=('python-tqdm' 'python-portalocker')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/07/e3/5d16bd5056730737e5d11deafb89e7e7435afa9c8bf8748f94019f1d2260/iopath-$pkgver.tar.gz")
md5sums=('3266a755ce0115b3bc9899bc6b2c9ff6')

build() {
  cd "$srcdir"/iopath-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/iopath-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

