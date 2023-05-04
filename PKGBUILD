# Maintainer: piernov <piernov@piernov.org>

pkgname=python-iopath
pkgver=0.1.10
pkgrel=1
pkgdesc="Lightweight I/O abstraction providing a common interface across storage backends"
arch=('any')
url="https://github.com/facebookresearch/iopath"
license=('MIT')
depends=('python-tqdm' 'python-portalocker' 'python-typing_extensions')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/72/73/b3d451dfc523756cf177d3ebb0af76dc7751b341c60e2a21871be400ae29/iopath-$pkgver.tar.gz")
md5sums=('a4c0f18461f0d0494ba4e9a4b31bf12c')

build() {
  cd "$srcdir"/iopath-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/iopath-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
}

